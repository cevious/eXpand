﻿using System;
using eXpand.ExpressApp.WorldCreator.Core;
using eXpand.Persistent.Base.PersistentMetaData;
using eXpand.Persistent.BaseImpl.PersistentMetaData;
using Machine.Specifications;
using System.Linq;

namespace eXpand.Tests.eXpand.WorldCreator
{
    public class When_validating_script
    {
        static PersistentAssemblyInfo _info;

        Establish context = () => new TestAppLication<PersistentAssemblyInfo>().Setup(null, info => {
            info.Name = "TestAssemlby";
            _info=info;
        });

         Because of = () => _info.Validate();

        
        It should_not_generate_assembly_in_memory =
            () =>
            AppDomain.CurrentDomain.GetAssemblies().Where(
                assembly => (assembly.FullName + "").StartsWith("TestAssemlby")).FirstOrDefault().ShouldBeNull();

//        It should_save_errors_at_persistentAssemblyInfo_compile_errors = () => _info.CompileErrors.ShouldBeNull();

    }

}
