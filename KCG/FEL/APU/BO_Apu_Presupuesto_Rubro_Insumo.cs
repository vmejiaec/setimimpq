
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.APU
{
    /// <summary>
    /// Acceso a los Web Services WS_APU
    /// Modulo: Apu target
    /// Tabla: Apu_Presupuesto_Rubro_Insumo
    /// </summary>
    [DataObject]
    public class BO_Apu_Presupuesto_Rubro_Insumo
    {
        #region  Adapter
        private WS_APU _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_APU Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_APU();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Rubro_Insumo> Get(string sortExpression, Scope s)
        {
            List<Apu_Presupuesto_Rubro_Insumo> lista = new List<Apu_Presupuesto_Rubro_Insumo>(Adapter.Apu_Presupuesto_Rubro_Insumo_Get(s));
            lista.Sort(new Apu_Presupuesto_Rubro_Insumo_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Rubro_Insumo_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Rubro_Insumo> GetByOrigen(string sortExpression, Scope s, string apu_origen_Id)
        {
            List<Apu_Presupuesto_Rubro_Insumo> lista = new List<Apu_Presupuesto_Rubro_Insumo>(Adapter.Apu_Presupuesto_Rubro_Insumo_GetByOrigen(s, apu_origen_Id));
            lista.Sort(new Apu_Presupuesto_Rubro_Insumo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByOrigen(Scope s, string apu_origen_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Rubro_Insumo_GetByOrigen(s, apu_origen_Id));
        }


        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Presupuesto_Rubro_Insumo o, Apu_Presupuesto_Rubro_Insumo original)
        {
            return Adapter.Apu_Presupuesto_Rubro_Insumo_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Rubro_Insumo o = new Apu_Presupuesto_Rubro_Insumo();
            Apu_Presupuesto_Rubro_Insumo original = new Apu_Presupuesto_Rubro_Insumo();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Presupuesto_Rubro_Insumo o)
        {
            return Adapter.Apu_Presupuesto_Rubro_Insumo_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Rubro_Insumo o = new Apu_Presupuesto_Rubro_Insumo();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Presupuesto_Rubro_Insumo o)
        {
            return Adapter.Apu_Presupuesto_Rubro_Insumo_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Rubro_Insumo original = new Apu_Presupuesto_Rubro_Insumo();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Apu_Presupuesto_Rubro_Insumo_Comparar : IComparer<Apu_Presupuesto_Rubro_Insumo>
        {
            private string _sortColumn;
            private bool _reverse;
            public Apu_Presupuesto_Rubro_Insumo_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Apu_Presupuesto_Rubro_Insumo x, Apu_Presupuesto_Rubro_Insumo y)
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
