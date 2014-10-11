using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using BEL;
using AEL.VAR;
using AEL.PAR;
using AEL.PER;
using AEL.INT;

namespace DEL.VAR
{
    public class DO_V_INT_Funcionario_Area
    {
        # region Adapters

        private static CEL.VAR.DO_V_INT_Funcionario_Area _adpFuncionario;
        private static CEL.VAR.DO_V_INT_Funcionario_Area adpFuncionario
        {
            get
            {
                if (_adpFuncionario == null)
                    _adpFuncionario = new CEL.VAR.DO_V_INT_Funcionario_Area();
                return _adpFuncionario;
            }
        }

        private static CEL.PER.DO_Per_Personal _adpPer_Personal;
        private static CEL.PER.DO_Per_Personal adpPer_Personal
        {
            get
            {
                if (_adpPer_Personal == null)
                    _adpPer_Personal = new CEL.PER.DO_Per_Personal();
                return _adpPer_Personal;
            }
        }

        private static CEL.INT.DO_Int_Usuario _adpInt_Usuario;
        private static CEL.INT.DO_Int_Usuario adpInt_Usuario
        {
            get
            {
                if (_adpInt_Usuario == null)
                    _adpInt_Usuario = new CEL.INT.DO_Int_Usuario();
                return _adpInt_Usuario;
            }
        }

        #endregion
        #region Operaciones
        public static string Insert(Scope s, V_INT_Funcionario_Area oFuncionario)
        {
            string res="-1";
            string sRazonSocial_Id;
            string sPersonal_Id;
            string sUsuario_Id;
            // Creo un objeto de Par_Razon Social
            Par_Razon_Social oRazonSocial = new Par_Razon_Social();
            oRazonSocial.Par_Tipo_Identificacion_Cedula = "S";
            oRazonSocial.Par_Tipo_Identificacion_Id = "1";
            oRazonSocial.Numero = oFuncionario.Persona_Codigo;
            oRazonSocial.Nombre = oFuncionario.Persona_Nombre;
            oRazonSocial.Nombre_Comercial = oFuncionario.Persona_Nombre;
            oRazonSocial.Int_Empresa_Id = "1";            

            sRazonSocial_Id = DEL.PAR.DO_Par_Razon_Social.Insert(s, oRazonSocial);

            // Creo un objeto de Per_Personal
            Per_Personal oPersonal = new Per_Personal();
            oPersonal.Coordinador = "N";
            oPersonal.Tecnico_Costos = "N";
            oPersonal.Int_Empresa_Id = "1";
            oPersonal.Jefe_Costos = "N";
            oPersonal.Par_Razon_Social_Id = sRazonSocial_Id;
            oPersonal.Tipo_Fiscalizacion = "N";
            oPersonal.Jefe_Fiscalizacion = "N";
            oPersonal.Fiscalizacion = "N";
            oPersonal.Contratista ="N";

            sPersonal_Id = adpPer_Personal.Insert(s, oPersonal);

            // Creo un objeto de Int_Usuario
            Int_Usuario oUsuario = new Int_Usuario();
            oUsuario.Nombre = oFuncionario.Persona_Usuario;
            oUsuario.Salt = oFuncionario.Persona_Usuario;
            oUsuario.Password = oFuncionario.Persona_Password;
            oUsuario.Usuario_Id_Ref = "1";
            oUsuario.Per_Personal_Id = sPersonal_Id;
            oUsuario.Pred_Ver_Version_Id = "1";
            oUsuario.Pred_Int_Sucursal_Id = "1";

            sUsuario_Id = adpInt_Usuario.Insert(s, oUsuario);

            // Se retorna los valores creados en el proceso
            res = "sRazonSocial_Id:" + sRazonSocial_Id + "-sPersonal_Id:" + sPersonal_Id + "-sUsuario_Id:" + sUsuario_Id;
            return res;
        }
        #endregion
    }
}
