using System;
using System.Collections.Generic;
using System.Text;
using AEL.SEG;
using BEL;
using AEL.INT;

namespace DEL.SEG
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Seguridades    
    /// </summary>
    public class DO_Seg_Rol_Usuario_Det
    {
        #region Adapter

        private static CEL.SEG.DO_Seg_Rol_Usuario_Det _adpSeg_Rol_Usuario_Det;
        private static CEL.SEG.DO_Seg_Rol_Usuario_Det adpSeg_Rol_Usuario_Det
        {
            get
            {
                if (_adpSeg_Rol_Usuario_Det == null)
                    _adpSeg_Rol_Usuario_Det = new CEL.SEG.DO_Seg_Rol_Usuario_Det();
                return _adpSeg_Rol_Usuario_Det;
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

        #region Operaciones con datos


        public static int Delete(Scope s, Seg_Rol_Usuario_Det oSeg_Rol_Usuario_Det)
        {
            int resultado = 0;
            try
            {
                adpSeg_Rol_Usuario_Det.Adapter.BeginTransaction();
                adpInt_Usuario.Adapter.Transaction = adpSeg_Rol_Usuario_Det.Adapter.Transaction;

                Int_Usuario lstInt_Usuario = adpInt_Usuario.GetById(s, oSeg_Rol_Usuario_Det.int_usuario_id)[0];
                Int_Usuario oInt_Usuario = new Int_Usuario(lstInt_Usuario);
                if (lstInt_Usuario.Pred_Int_Sucursal_Id == oSeg_Rol_Usuario_Det.int_usuario_id)
                {
                    oInt_Usuario.Pred_Int_Sucursal_Id = null;
                    adpInt_Usuario.Update(s, oInt_Usuario, lstInt_Usuario);
                }
                resultado = adpSeg_Rol_Usuario_Det.Delete(s, oSeg_Rol_Usuario_Det);

                adpSeg_Rol_Usuario_Det.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpSeg_Rol_Usuario_Det.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }
        #endregion
    }
}