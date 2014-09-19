#region Código Anterior
//using System;
//using System.Collections.Generic;
//using System.Text;
//using AEL.SEG;
//using BEL;

//namespace DEL.SEG
//{
//    /// <summary>
//    /// Acceso a la base de datos
//    /// Modulo:Seguridades    
//    /// </summary>
//    public class DO_Seg_Rol_Menu
//    {
//        #region Adapter

//        private static CEL.SEG.DO_Seg_Rol_Usuario _adpSeg_Rol_Usuario;
//        private static CEL.SEG.DO_Seg_Rol_Usuario adpSeg_Rol_Usuario
//        {
//            get
//            {
//                if (_adpSeg_Rol_Usuario == null)
//                    _adpSeg_Rol_Usuario = new CEL.SEG.DO_Seg_Rol_Usuario();
//                return _adpSeg_Rol_Usuario;
//            }
//        }

//        private static CEL.SEG.DO_Seg_Rol_Menu _adpSeg_Rol_Menu;
//        private static CEL.SEG.DO_Seg_Rol_Menu adpSeg_Rol_Menu
//        {
//            get
//            {
//                if (_adpSeg_Rol_Menu == null)
//                    _adpSeg_Rol_Menu = new CEL.SEG.DO_Seg_Rol_Menu();
//                return _adpSeg_Rol_Menu;
//            }
//        }

//        private static CEL.SEG.DO_Seg_Menu _adpSeg_Menu;
//        private static CEL.SEG.DO_Seg_Menu adpSeg_Menu
//        {
//            get
//            {
//                if (_adpSeg_Menu == null)
//                    _adpSeg_Menu = new CEL.SEG.DO_Seg_Menu();
//                return _adpSeg_Menu;
//            }
//        }
//        #endregion

//        #region Operaciones con datos


//        public static string Insert(Scope s, Seg_Rol_Menu oSeg_Rol_Menu)
//        {
//            // Inserto los objetos
//            string resultado;
//            try
//            {
//                adpSeg_Rol_Menu.Adapter.BeginTransaction();
//                adpSeg_Menu.Adapter.Transaction = adpSeg_Rol_Menu.Adapter.Transaction;

//                resultado = adpSeg_Rol_Menu.Insert(s, oSeg_Rol_Menu);

//                List<Seg_Rol_Usuario> listSeg_Rol_Usuario = adpSeg_Rol_Usuario.GetByRol(s, oSeg_Rol_Menu.Seg_Rol_Id);

//                foreach (Seg_Rol_Usuario v_listseg_rol_usuario in listSeg_Rol_Usuario)
//                {
//                    Seg_Menu oSeg_Menu = new Seg_Menu();
//                    oSeg_Menu.Dic_Pantalla_Id = oSeg_Rol_Menu.Dic_Pantalla_Id;
//                    oSeg_Menu.Grupo = oSeg_Rol_Menu.Grupo;
//                    oSeg_Menu.Orden = 0;
//                    oSeg_Menu.Int_Usuario_Id = v_listseg_rol_usuario.Int_Usuario_Id;
//                    oSeg_Menu.Dic_Con_Elemento_Id = oSeg_Rol_Menu.Dic_Con_Elemento_Id;
//                    oSeg_Menu.Seg_Rol_Id = oSeg_Rol_Menu.Seg_Rol_Id;

//                    adpSeg_Menu.Insert(s, oSeg_Menu);
//                }

//                adpSeg_Rol_Menu.Adapter.CommitTransaction();
//            }
//            catch (Exception e)
//            {
//                adpSeg_Rol_Menu.Adapter.RollbackTransaction();
//                throw (e);
//            }
//            return resultado;
//        }
//        public static int Delete(Scope s, Seg_Rol_Menu oSeg_Rol_Menu)
//        {
//            int resultado = 0;
//            try
//            {
//                adpSeg_Rol_Menu.Adapter.BeginTransaction();
//                adpSeg_Menu.Adapter.Transaction = adpSeg_Rol_Menu.Adapter.Transaction;

//                List<Seg_Menu> listSeg_Menu =
//                    adpSeg_Menu.GetByRolElemento(s, oSeg_Rol_Menu.Seg_Rol_Id, oSeg_Rol_Menu.Dic_Con_Elemento_Id,
//                                                 s.Par_Servidor_Id);

//                foreach (Seg_Menu v_seg_menu in listSeg_Menu)
//                {
//                    adpSeg_Menu.Delete(s, v_seg_menu);
//                }

//                resultado = adpSeg_Rol_Menu.Delete(s, oSeg_Rol_Menu);

//                adpSeg_Rol_Menu.Adapter.CommitTransaction();
//            }
//            catch (Exception e)
//            {
//                adpSeg_Rol_Menu.Adapter.RollbackTransaction();
//                throw (e);
//            }
//            return resultado;
//        }
//        #endregion
//    }
//}
#endregion

using System;
using System.Collections.Generic;
using System.Text;
using AEL.SEG;
using BEL;

namespace DEL.SEG
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Seguridades    
    /// </summary>
    public class DO_Seg_Rol_Menu
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
        #endregion

        #region Operaciones con datos


        public static string Insert(Scope s, Seg_Rol_Menu oSeg_Rol_Menu)
        {
            // Inserto los objetos
            string resultado;
            try
            {
                adpSeg_Rol_Menu.Adapter.BeginTransaction();
                adpSeg_Menu.Adapter.Transaction = adpSeg_Rol_Menu.Adapter.Transaction;

                //2009-11-17--------------------------------------------------------------------
                adpSeg_Rol_Usuario.Adapter.Transaction = adpSeg_Rol_Usuario.Adapter.Transaction;
                //------------------------------------------------------------------------------

                resultado = adpSeg_Rol_Menu.Insert(s, oSeg_Rol_Menu);

                List<Seg_Rol_Usuario> listSeg_Rol_Usuario = adpSeg_Rol_Usuario.GetByRol(s, oSeg_Rol_Menu.Seg_Rol_Id);

                foreach (Seg_Rol_Usuario v_listseg_rol_usuario in listSeg_Rol_Usuario)
                {
                    Seg_Menu oSeg_Menu = new Seg_Menu();
                    oSeg_Menu.Dic_Pantalla_Id = oSeg_Rol_Menu.Dic_Pantalla_Id;
                    oSeg_Menu.Grupo = oSeg_Rol_Menu.Grupo;
                    oSeg_Menu.Orden = 0;
                    oSeg_Menu.Int_Usuario_Id = v_listseg_rol_usuario.Int_Usuario_Id;
                    oSeg_Menu.Dic_Con_Elemento_Id = oSeg_Rol_Menu.Dic_Con_Elemento_Id;
                    oSeg_Menu.Seg_Rol_Id = oSeg_Rol_Menu.Seg_Rol_Id;

                    adpSeg_Menu.Insert(s, oSeg_Menu);
                }

                adpSeg_Rol_Menu.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpSeg_Rol_Menu.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }
        public static int Delete(Scope s, Seg_Rol_Menu oSeg_Rol_Menu)
        {
            int resultado = 0;
            try
            {
                adpSeg_Rol_Menu.Adapter.BeginTransaction();
                adpSeg_Menu.Adapter.Transaction = adpSeg_Rol_Menu.Adapter.Transaction;

                List<Seg_Menu> listSeg_Menu =
                    adpSeg_Menu.GetByRolElemento(s, oSeg_Rol_Menu.Seg_Rol_Id, oSeg_Rol_Menu.Dic_Con_Elemento_Id,
                                                 s.Par_Servidor_Id);

                foreach (Seg_Menu v_seg_menu in listSeg_Menu)
                {
                    adpSeg_Menu.Delete(s, v_seg_menu);
                }

                resultado = adpSeg_Rol_Menu.Delete(s, oSeg_Rol_Menu);

                adpSeg_Rol_Menu.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpSeg_Rol_Menu.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }
        #endregion
    }
}