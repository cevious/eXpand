﻿using System;
using DevExpress.Xpo;
using eXpand.Persistent.Base.PersistentMetaData;

namespace eXpand.ExpressApp.WorldCreator.PersistentTypesHelpers {
    public class CodeTemplateBuilder {
        public static ICodeTemplate CreateDefaultTemplate(TemplateType templateType, Session session, Type codeTemplateType, CodeDomProvider codeDomProvider) {
            
            var defaultTemplate = CodeTemplateQuery.FindDefaultTemplate(templateType, session, codeTemplateType,codeDomProvider);
            if (defaultTemplate== null) {
                defaultTemplate = (ICodeTemplate)Activator.CreateInstance(codeTemplateType, session);
                defaultTemplate.IsDefault = true;
                defaultTemplate.TemplateType=templateType;
                defaultTemplate.CodeDomProvider=codeDomProvider;
                defaultTemplate.SetDefaults();
            }
            return defaultTemplate;
            
        }
    }
}