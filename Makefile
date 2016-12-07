PROJECT = rabbitmq_tracing
PROJECT_DESCRIPTION = RabbitMQ message logging / tracing
PROJECT_MOD = rabbit_tracing_app

define PROJECT_ENV
[
	    {directory, "/var/tmp/rabbitmq-tracing"},
	    {username, <<"guest">>},
	    {password, <<"guest">>}
	  ]
endef

define PROJECT_APP_EXTRA_KEYS
	{broker_version_requirements, []}
endef

DEPS = rabbit_common rabbit rabbitmq_management
TEST_DEPS = rabbitmq_ct_helpers rabbitmq_ct_client_helpers

DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include rabbitmq-components.mk
include erlang.mk
