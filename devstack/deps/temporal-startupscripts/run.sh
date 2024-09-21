#!/bin/bash

until tctl admin cluster gsa | grep -q RunId; do
  echo "Waiting for find search attributes"
  sleep 2
done

tctl --auto_confirm admin cluster add-search-attributes \
  --name HealthCheckTriggeredBy --type Keyword \
  --name createdBy.personaId --type Keyword

until tctl admin cluster gsa | grep -q HealthCheckTriggeredBy; do
  echo "Waiting for search attributes to be added: HealthCheckTriggeredBy"
  sleep 2
done

until tctl admin cluster gsa | grep -q createdBy.personaId; do
  echo "Waiting for search attributes to be added: PersonaId"
  sleep 2
done

exit 0
