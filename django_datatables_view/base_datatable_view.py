from django.core.exceptions import FieldError
from django.http import JsonResponse
from django.views.generic.base import View


class BaseDatatableView(View):
    model = None
    columns = []
    order_columns = []
    max_display_length = 100

    def get_initial_queryset(self):
        return self.model.objects.all()

    def filter_queryset(self, queryset):
        return queryset

    def render_column(self, row, column):
        return getattr(row, column)

    def ordering(self, queryset):
        column_index = self.request.GET.get("order[0][column]")
        direction = self.request.GET.get("order[0][dir]", "asc")

        if column_index is None:
            return queryset

        try:
            order_column = self.order_columns[int(column_index)]
        except (IndexError, TypeError, ValueError):
            return queryset

        if not order_column or order_column == "Select":
            return queryset

        prefix = "-" if direction == "desc" else ""
        try:
            return queryset.order_by(prefix + order_column)
        except FieldError:
            return queryset

    def paging(self, queryset):
        try:
            start = int(self.request.GET.get("start", 0))
        except (TypeError, ValueError):
            start = 0

        try:
            length = int(self.request.GET.get("length", 10))
        except (TypeError, ValueError):
            length = 10

        if length < 0:
            length = self.max_display_length
        length = min(length, self.max_display_length)

        return queryset[start:start + length]

    def prepare_results(self, queryset):
        data = []
        for row in queryset:
            data.append([self.render_column(row, column) for column in self.columns])
        return data

    def get(self, request, *args, **kwargs):
        queryset = self.get_initial_queryset()
        records_total = queryset.count()

        filtered_queryset = self.filter_queryset(queryset)
        records_filtered = filtered_queryset.count()
        ordered_queryset = self.ordering(filtered_queryset)
        page_queryset = self.paging(ordered_queryset)

        return JsonResponse(
            {
                "draw": int(request.GET.get("draw", 1)),
                "recordsTotal": records_total,
                "recordsFiltered": records_filtered,
                "data": self.prepare_results(page_queryset),
            }
        )
