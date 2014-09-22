using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.CodeDom;
using System.Reflection;
using System.CodeDom.Compiler;
using System.IO;

namespace zGeneraClases
{
    public class Generador
    {
        // Generar el código de las clases        
        public string claseNombre; 
        public string NameSpace;
        public string claseBase;
        public List<genCampo> campos = new List<genCampo>();

        //List<string> camposBase = new List<string>(new string[] {"Id","Codigo","Nombre","Estado"} );

        CodeCompileUnit targetUnit;
        CodeTypeDeclaration targetClass;

        public Generador()
        { 

        }

        public Generador( 
            string _claseNombre,
            string _NameSpace,
            string _claseBase,
            List<genCampo> _campos)
        {
            // carga los atributos
            claseNombre = _claseNombre;
            NameSpace = _NameSpace;
            claseBase = _claseBase;
            campos = _campos;
        }

        public void CrearClasesAEL(ExtraeMetaDatos datos, string _NameSpace)
        {
            // Crear el directorio dos niveles arriba con fecha y hora
            //string directorio = DateTime.Now.ToString( _NameSpace + "_yyyy-MM-dd_hh-mm");
            //Directory.CreateDirectory("..\\..\\" + directorio);
            // Crear las clases AEL en la carpeta
            foreach (var t in datos.BaseDatos)
            {
                this.claseNombre = t.Nombre;
                this.NameSpace = _NameSpace;
                this.campos = t.Campos;
                CrearClaseAEL("AEL");
            }
        }


        public void Inicializa()
        {
            targetUnit = new CodeCompileUnit();
            // El nombre de la clase y sus atributos
            targetClass = new CodeTypeDeclaration(claseNombre);
            targetClass.IsClass = true;
            targetClass.TypeAttributes = TypeAttributes.Public;
            if ( ! String.IsNullOrEmpty(claseBase)) targetClass.BaseTypes.Add(claseBase);
            // El namespace
            CodeNamespace nsClase = new CodeNamespace(NameSpace);
            // Los imports
            nsClase.Imports.Add(new CodeNamespaceImport("System"));
            nsClase.Imports.Add(new CodeNamespaceImport("System.Collections.Generic"));
            nsClase.Imports.Add(new CodeNamespaceImport("System.Text"));
            // añade
            nsClase.Types.Add(targetClass);
            targetUnit.Namespaces.Add(nsClase);
        }

        public void addCampos()
        {
            foreach (var campo in campos)
            {
                CodeMemberField widthValueField = new CodeMemberField();
                widthValueField.Attributes = MemberAttributes.Private;
                widthValueField.Name = campo.atributo;
                widthValueField.Type = new CodeTypeReference(campo.Tipo);
                widthValueField.Comments.Add(new CodeCommentStatement(campo.Comentario));
                targetClass.Members.Add(widthValueField);
                // añade la propiedad
                addPropiedad(campo);
            }
        }

        public void addPropiedad(genCampo campo)
        {
            CodeMemberProperty widthProperty = new CodeMemberProperty();
            widthProperty.Attributes = MemberAttributes.Public | MemberAttributes.Final;
            widthProperty.Name = campo.propiedad;
            widthProperty.Type = new CodeTypeReference(campo.Tipo);
            widthProperty.Comments.Add(new CodeCommentStatement(campo.Comentario));

            widthProperty.GetStatements.Add(
                new CodeMethodReturnStatement(
                    new CodeFieldReferenceExpression(new CodeThisReferenceExpression(), campo.atributo)
                )
            );

            widthProperty.SetStatements.Add(
                new CodeAssignStatement(
                    new CodeFieldReferenceExpression(new CodeThisReferenceExpression(), campo.atributo),
                    new CodePropertySetValueReferenceExpression()
                )
            );

            widthProperty.HasGet = true;
            widthProperty.HasSet = true;

            targetClass.Members.Add(widthProperty);
        }

        public void addPropiedades()
        {

            // Declare the read only Area property.
            CodeMemberProperty areaProperty = new CodeMemberProperty();
            areaProperty.Attributes =
                MemberAttributes.Public | MemberAttributes.Final;
            areaProperty.Name = "Area";
            areaProperty.HasGet = true;
            areaProperty.Type = new CodeTypeReference(typeof(System.Double));
            areaProperty.Comments.Add(new CodeCommentStatement(
                "The Area property for the object."));

            // Create an expression to calculate the area for the get accessor  
            // of the Area property.
            CodeBinaryOperatorExpression areaExpression =
                new CodeBinaryOperatorExpression(
                new CodeFieldReferenceExpression(
                new CodeThisReferenceExpression(), "widthValue"),
                CodeBinaryOperatorType.Multiply,
                new CodeFieldReferenceExpression(
                new CodeThisReferenceExpression(), "heightValue"));
            areaProperty.GetStatements.Add(
                new CodeMethodReturnStatement(areaExpression));
            targetClass.Members.Add(areaProperty);
        }

        public void addMetodo()
        {
            // Declaring a ToString method
            CodeMemberMethod toStringMethod = new CodeMemberMethod();
            toStringMethod.Attributes =
                MemberAttributes.Public | MemberAttributes.Override;
            toStringMethod.Name = "ToString";
            toStringMethod.ReturnType =
                new CodeTypeReference(typeof(System.String));

            CodeFieldReferenceExpression widthReference =
                new CodeFieldReferenceExpression(
                new CodeThisReferenceExpression(), "Width");
            CodeFieldReferenceExpression heightReference =
                new CodeFieldReferenceExpression(
                new CodeThisReferenceExpression(), "Height");
            CodeFieldReferenceExpression areaReference =
                new CodeFieldReferenceExpression(
                new CodeThisReferenceExpression(), "Area");

            // Declaring a return statement for method ToString.
            CodeMethodReturnStatement returnStatement =
                new CodeMethodReturnStatement();

            // This statement returns a string representation of the width, 
            // height, and area. 
            string formattedOutput = "The object:" + Environment.NewLine +
                " width = {0}," + Environment.NewLine +
                " height = {1}," + Environment.NewLine +
                " area = {2}";
            returnStatement.Expression =
                new CodeMethodInvokeExpression(
                new CodeTypeReferenceExpression("System.String"), "Format",
                new CodePrimitiveExpression(formattedOutput),
                widthReference, heightReference, areaReference);
            toStringMethod.Statements.Add(returnStatement);
            targetClass.Members.Add(toStringMethod);
        }

        public void addConstructorVacio()
        {
            // Declare the constructor
            CodeConstructor constructor = new CodeConstructor();
            constructor.Attributes =
                MemberAttributes.Public | MemberAttributes.Final;
            targetClass.Members.Add(constructor);
        }

        public void addConstructor()
        {
            // Declare the constructor
            CodeConstructor constructor = new CodeConstructor();
            constructor.Attributes =
                MemberAttributes.Public | MemberAttributes.Final;
            // Crea los parámetros del constructor
            foreach (var campo in campos)
            {
                constructor.Parameters.Add(
                    new CodeParameterDeclarationExpression(campo.Tipo, campo.parametro) 
                );
                CodeFieldReferenceExpression widthReference =
                    new CodeFieldReferenceExpression(
                    new CodeThisReferenceExpression(), campo.propiedad);
                constructor.Statements.Add(new CodeAssignStatement(widthReference,
                    new CodeArgumentReferenceExpression(campo.parametro)));
            }

            targetClass.Members.Add(constructor);
        }

        public void addConstructorCopy()
        {
            // Declara el constructor copia
            CodeConstructor constructor = new CodeConstructor();
            constructor.Attributes =
                MemberAttributes.Public | MemberAttributes.Final;
            // parámetro del constructor copia
            constructor.Parameters.Add(
                new CodeParameterDeclarationExpression(new CodeTypeReference(claseNombre), "o")
            );
            // Crea la copia
            foreach (var campo in campos)
            {
                CodeFieldReferenceExpression widthReference =
                    new CodeFieldReferenceExpression(
                    new CodeThisReferenceExpression(), campo.propiedad);
                constructor.Statements.Add(new CodeAssignStatement(widthReference,
                    new CodeArgumentReferenceExpression("o." + campo.propiedad)));
            }

            targetClass.Members.Add(constructor);
        }

        public void addMain()
        {
            CodeEntryPointMethod start = new CodeEntryPointMethod();
            CodeObjectCreateExpression objectCreate =
                new CodeObjectCreateExpression(
                new CodeTypeReference("CodeDOMCreatedClass"),
                new CodePrimitiveExpression(5.3),
                new CodePrimitiveExpression(6.9));

            // Add the statement: 
            // "CodeDOMCreatedClass testClass =  
            //     new CodeDOMCreatedClass(5.3, 6.9);"
            start.Statements.Add(new CodeVariableDeclarationStatement(
                new CodeTypeReference("CodeDOMCreatedClass"), "testClass",
                objectCreate));

            // Creat the expression: 
            // "testClass.ToString()"
            CodeMethodInvokeExpression toStringInvoke =
                new CodeMethodInvokeExpression(
                new CodeVariableReferenceExpression("testClass"), "ToString");

            // Add a System.Console.WriteLine statement with the previous  
            // expression as a parameter.
            start.Statements.Add(new CodeMethodInvokeExpression(
                new CodeTypeReferenceExpression("System.Console"),
                "WriteLine", toStringInvoke));
            targetClass.Members.Add(start);
        }

        public void CrearClase(string directorio)
        {
            CodeDomProvider provider = CodeDomProvider.CreateProvider("CSharp");
            CodeGeneratorOptions options = new CodeGeneratorOptions();
            options.BracingStyle = "C";
            // grabar el archivo en el directorio creado
            using (StreamWriter sourceWriter = new StreamWriter("..\\..\\" + directorio + "\\" + claseNombre + ".cs"))
            {
                provider.GenerateCodeFromCompileUnit(targetUnit, sourceWriter, options);
            }
        }

        public void CrearClaseAEL(string directorio)
        {
            Inicializa();
            addCampos();
            addConstructorVacio();
            addConstructor();
            addConstructorCopy();
            CrearClase(directorio);
        }
    }
}
