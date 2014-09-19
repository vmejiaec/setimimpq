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
    public class DO_Seg_Rol_Usuario
    {
        #region Adapter

        private static CEL.SEG.DO_Seg_Rol_Usuario _adpSeg_Rol_Usuario;
        private static CEL.SEG.DO_Seg_Rol_Usuario adpSeg_Rol_Usuario
        {
            get
            {
                if (_adpSeg_Rol_Usuario == null)
                    _adpSeg_Rol_Usuario = new CEL.SEG.DO_Seg_Rol_Usuario();
                return _adpSeg_Rol_Usuario;
            }
        }

        private static CEL.SEG.DO_Seg_Rol_Menu _adpSeg_Rol_Menu;
        private static CEL.SEG.DO_Seg_Rol_Menu adpSeg_Rol_Menu
        {
            get
            {
                if (_adpSeg_Rol_Menu == null)
                    _adpSeg_Rol_Menu = new CEL.SEG.DO_Seg_Rol_Menu();
                return _adpSeg_Rol_Menu;
            }
        }

        private static CEL.SEG.DO_Seg_Menu _adpSeg_Menu;
        private static CEL.SEG.DO_Seg_Menu adpSeg_Menu
        {
            get
            {
                if (_adpSeg_Menu == null)
                    _adpSeg_Menu = new CEL.SEG.DO_Seg_Menu();
                return _adpSeg_Menu;
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


        public static string Insert(Scope s, Seg_Rol_Usuario oSeg_Rol_Usuario)
        {
            // Inserto los objetos
            string resultado;
            try
            {
                adpSeg_Rol_Usuario.Adapter.BeginTransaction();
                adpSeg_Rol_Menu.Adapter.Transaction = adpSeg_Rol_Usuario.Adapter.Transaction;
                adpSeg_Menu.Adapter.Transaction = adpSeg_Rol_Usuario.Adapter.Transaction;

                resultado = adpSeg_Rol_Usuario.Insert(s, oSeg_Rol_Usuario);

                List<Seg_Rol_Menu> listSeg_Rol_Menu = adpSeg_Rol_Menu.GetByRol(s, oSeg_Rol_Usuario.Seg_Rol_Id);

                int orden = 1;

                foreach (Seg_Rol_Menu v_listseg_rol_menu in listSeg_Rol_Menu)
                {
                    Seg_Menu oSeg_Menu = new Seg_Menu();
                    oSeg_Menu.Dic_Pantalla_Id = v_listseg_rol_menu.Dic_Pantalla_Id;
                    oSeg_Menu.Grupo = v_listseg_rol_menu.Grupo;
                    oSeg_Menu.Orden = orden;
                    oSeg_Menu.Int_Usuario_Id = oSeg_Rol_Usuario.Int_Usuario_Id;
                    oSeg_Menu.Dic_Con_Elemento_Id = v_listseg_rol_menu.Dic_Con_Elemento_Id;
                    oSeg_Menu.Seg_Rol_Id = oSeg_Rol_Usuario.Seg_Rol_Id;

                    adpSeg_Menu.Insert(s, oSeg_Menu);
                    orden++;
                }

                adpSeg_Rol_Usuario.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpSeg_Rol_Usuario.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }
        public static int Delete(Scope s, Seg_Rol_Usuario oSeg_Rol_Usuario)
        {
            int resultado = 0;
            try
            {
                adpSeg_Rol_Usuario.Adapter.BeginTransaction();
                adpSeg_Menu.Adapter.Transaction = adpSeg_Rol_Usuario.Adapter.Transaction;

                //2009-11-17-----------------------------------------------------------------
                adpInt_Usuario.Adapter.Transaction = adpSeg_Rol_Usuario.Adapter.Transaction;
                //---------------------------------------------------------------------------

                Int_Usuario v_Int_usuario_Original = adpInt_Usuario.GetById(s, oSeg_Rol_Usuario.Int_Usuario_Id)[0];
                Int_Usuario v_Int_Usuario_New = new Int_Usuario(v_Int_usuario_Original);


                if (v_Int_usuario_Original.Pred_Seg_Rol_Id == oSeg_Rol_Usuario.Seg_Rol_Id)
                {
                    v_Int_Usuario_New.Pred_Seg_Rol_Id = null;
                    adpInt_Usuario.Update(s, v_Int_Usuario_New, v_Int_usuario_Original);
                }

                List<Seg_Menu> listSeg_Menu =
                    adpSeg_Menu.GetByRolUsuario(s, oSeg_Rol_Usuario.Seg_Rol_Id, oSeg_Rol_Usuario.Int_Usuario_Id,
                                                s.Par_Servidor_Id);

                foreach (Seg_Menu v_seg_menu in listSeg_Menu)
                {
                    adpSeg_Menu.Delete(s, v_seg_menu);
                }

                resultado = adpSeg_Rol_Usuario.Delete(s, oSeg_Rol_Usuario);

                adpSeg_Rol_Usuario.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpSeg_Rol_Usuario.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }
        #endregion
    }
}