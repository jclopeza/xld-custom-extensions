# Properties to check. The property 'order' doesn't have to be here.
properties = ['configVersion', 'chartName', 'chartVersion']
executeModify = False
for prop in properties:
    if (deployed[prop] != previousDeployed[prop]):
        executeModify = True

if executeModify:
    myStep = steps.os_script(
        description = "Updating component {0}".format(deployed.name),
        order = deployed['order'],
        script = "scripts/modify.sh.ftl",
        freemarker_context = {
            "deployedApplicationVersion": deployedApplication.version.name,
            "deployedApplicationEnvironment": deployedApplication.environment.name
            # Some more properties
        }
    )
else:
    myStep = steps.noop(
        description = "Only the 'order' property has changed. Nothing to do on {0}".format(deployed.name),
        order = deployed['order']
    )

context.addStep(myStep)