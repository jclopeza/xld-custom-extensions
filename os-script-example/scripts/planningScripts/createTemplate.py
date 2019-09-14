context.addStep(
    steps.template(
        description = "Descripcion",
        order = 55,
        target_path = "/tmp/miTemplateRenderizada.txt",
        template_path = "templates/miTemplate.ftl",
        freemarker_context = {"propertyLyhsoft": deployed.propInTemplate})
        # target_host = deployed.container.host)
    )
