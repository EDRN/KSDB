#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "${SCRIPT_DIR}"

ACTION="${1:-up}"

print_summary() {
    port="${KSDB_PORT:-8000}"
    user="${DJANGO_SUPERUSER_USERNAME:-admin}"
    password="${DJANGO_SUPERUSER_PASSWORD:-admin}"

    cat <<EOF
KSDB is available at: http://localhost:${port}/
Default login: ${user} / ${password}
EOF
}

case "${ACTION}" in
    up)
        docker compose up --build -d
        print_summary
        ;;
    fresh)
        docker compose down -v --remove-orphans
        docker compose up --build -d
        print_summary
        ;;
    down)
        docker compose down --remove-orphans
        ;;
    restart)
        docker compose up --build -d
        ;;
    logs)
        docker compose logs -f web
        ;;
    ps|status)
        docker compose ps
        ;;
    help|-h|--help)
        cat <<'EOF'
Usage: ./deploy.sh [up|fresh|down|restart|logs|status]

Commands:
  up       Build and start KSDB in the background.
  fresh    Recreate KSDB from scratch, including a fresh database volume.
  down     Stop the stack.
  restart  Rebuild and restart the stack without deleting data.
  logs     Follow the web container logs.
  status   Show container status.
EOF
        ;;
    *)
        echo "Unknown action: ${ACTION}" >&2
        echo "Run ./deploy.sh --help for usage." >&2
        exit 1
        ;;
esac
