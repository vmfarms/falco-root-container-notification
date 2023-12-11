install: check-patch-falcosidekick create-falco-configmap patch-falcosidekick restart-falco restart-falcosidekick
	@echo "Installation complete."

uninstall: remove-falco-configmap unpatch-falcosidekick restart-falco restart-falcosidekick
	@echo "Removed."

create-falco-configmap:
	kubectl apply -f config/falco-custom-rules.yaml

remove-falco-configmap:
	kubectl delete -f config/falco-custom-rules.yaml

check-patch-falcosidekick:
	@if grep -cq REPLACE_ME config/falcosidekick-patch.yaml; then echo "Please, add a valid Slack Webhook in the config/falcosidekick-patch.yaml file."; exit 1; fi

patch-falcosidekick:
	kubectl patch -n falco secrets falco-falcosidekick --patch-file config/falcosidekick-patch.yaml

unpatch-falcosidekick:
	kubectl patch -n falco secrets falco-falcosidekick --patch '{"data": {"SLACK_WEBHOOKURL": "", "SLACK_MINIMUMPRIORITY": ""}}'

restart-falco:
	kubectl rollout restart daemonset -n falco falco

restart-falcosidekick:
	kubectl rollout restart deployment -n falco falco-falcosidekick
