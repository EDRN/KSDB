from django.core.management import call_command
from django.core.management.base import BaseCommand

from ksdb.models import organ, person, program, protocol, publication
from ksdb.rdf_ingest_utils import ensure_default_programs


class Command(BaseCommand):
    help = "Preload KSDB data into an empty database."

    def add_arguments(self, parser):
        parser.add_argument(
            "--force",
            action="store_true",
            help="Run the preload even when core tables already contain rows.",
        )

    def handle(self, *args, **options):
        force = options.get("force", False)
        core_counts = {
            "program": program.objects.count(),
            "organ": organ.objects.count(),
            "person": person.objects.count(),
            "publication": publication.objects.count(),
            "protocol": protocol.objects.count(),
        }

        if not force and any(core_counts.values()):
            self.stdout.write("Skipping KSDB preload because the database already contains data: {}".format(core_counts))
            return

        ensure_default_programs()
        call_command("ingestorgans")
        call_command("ingestpersons")
        call_command("ingestpublications")
        call_command("ingestprotocols")

        final_counts = {
            "program": program.objects.count(),
            "organ": organ.objects.count(),
            "person": person.objects.count(),
            "publication": publication.objects.count(),
            "protocol": protocol.objects.count(),
        }
        self.stdout.write("Completed KSDB preload: {}".format(final_counts))
