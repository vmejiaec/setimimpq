
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.SEG
{
    /// <summary>
    /// Acceso a los Web Services WS_SEG
    /// Modulo: Seguridad 
    /// Tabla: Seg_Menu
    /// </summary>
    [DataObject]
    public class BO_Seg_Menu
    {
        #region  Adapter
        private WS_SEG _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_SEG Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_SEG();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Seg_Menu> Get(string sortExpression, Scope s, string Par_Servidor_Id)
        {
            List<Seg_Menu> lista = new List<Seg_Menu>(Adapter.Seg_Menu_Get(s, Par_Servidor_Id));
            lista.Sort(new Seg_Menu_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s, string Par_Servidor_Id)
        {
            return EntidadDT.GetDT(Adapter.Seg_Menu_Get(s, Par_Servidor_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Seg_Menu> GetByCodigo(string sortExpression, Scope s, string Codigo, string par_servidor_id)
        {
            List<Seg_Menu> lista = new List<Seg_Menu>(Adapter.Seg_Menu_GetByCodigo(s, Codigo, par_servidor_id));
            lista.Sort(new Seg_Menu_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo, string par_servidor_id)
        {
            return EntidadDT.GetDT(Adapter.Seg_Menu_GetByCodigo(s, Codigo, par_servidor_id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Seg_Menu> GetById(string sortExpression, Scope s, string Id, string par_servidor_id)
        {
            List<Seg_Menu> lista = new List<Seg_Menu>(Adapter.Seg_Menu_GetById(s, Id, par_servidor_id));
            lista.Sort(new Seg_Menu_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id, string par_servidor_id)
        {
            return EntidadDT.GetDT(Adapter.Seg_Menu_GetById(s, Id, par_servidor_id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Seg_Menu> GetByRolUsuario(string sortExpression, Scope s, string Seg_Rol_Id, string Int_Usuario_Id, string par_servidor_id)
        {
            List<Seg_Menu> lista = new List<Seg_Menu>(Adapter.Seg_Menu_GetByRolUsuario(s, Seg_Rol_Id, Int_Usuario_Id, par_servidor_id));
            lista.Sort(new Seg_Menu_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByRolUsuario(Scope s, string Seg_Rol_Id, string Int_Usuario_Id, string par_servidor_id)
        {
            return EntidadDT.GetDT(Adapter.Seg_Menu_GetByRolUsuario(s, Seg_Rol_Id, Int_Usuario_Id, par_servidor_id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Seg_Menu> GetByRolElemento(string sortExpression, Scope s, string Seg_Rol_Id, string Dic_Con_Elemento_Id, string par_servidor_id)
        {
            List<Seg_Menu> lista = new List<Seg_Menu>(Adapter.Seg_Menu_GetByRolElemento(s, Seg_Rol_Id, Dic_Con_Elemento_Id, par_servidor_id));
            lista.Sort(new Seg_Menu_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByRolElemento(Scope s, string Seg_Rol_Id, string Dic_Con_Elemento_Id, string par_servidor_id)
        {
            return EntidadDT.GetDT(Adapter.Seg_Menu_GetByRolElemento(s, Seg_Rol_Id, Dic_Con_Elemento_Id, par_servidor_id));
        }

        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Seg_Menu
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Seg_Menu o, Seg_Menu original)
        {
            return Adapter.Seg_Menu_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Seg_Menu o = new Seg_Menu();
            Seg_Menu original = new Seg_Menu();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Seg_Menu
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Seg_Menu o)
        {
            return Adapter.Seg_Menu_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Seg_Menu o = new Seg_Menu();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Seg_Menu
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Seg_Menu o)
        {
            return Adapter.Seg_Menu_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Seg_Menu original = new Seg_Menu();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Seg_Menu_Comparar : IComparer<Seg_Menu>
        {
            private string _sortColumn;
            private bool _reverse;
            public Seg_Menu_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Seg_Menu x, Seg_Menu y)
            {
                int retVal = 0;
                switch (_sortColumn)
                {
                    case "Id":
                        retVal = string.Compare(x.Id, y.Id);
                        break;
                    case "Nombre":
                        retVal = string.Compare(x.Nombre, y.Nombre);
                        break;
                    case "Codigo":
                        retVal = string.Compare(x.Codigo, y.Codigo);
                        break;
                    case "Estado":
                        retVal = string.Compare(x.Estado, y.Estado);
                        break;
                }
                return (retVal * (_reverse ? -1 : 1));
            }
        }
        #endregion
    }
}