
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
    /// Tabla: Apu_Presupuesto_Cuadrilla
    /// </summary>
    [DataObject]
    public class BO_Apu_Presupuesto_Cuadrilla
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
        #region Obtenci�n de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Cuadrilla> Get(string sortExpression, Scope s)
        {
            List<Apu_Presupuesto_Cuadrilla> lista = new List<Apu_Presupuesto_Cuadrilla>(Adapter.Apu_Presupuesto_Cuadrilla_Get(s));
            lista.Sort(new Apu_Presupuesto_Cuadrilla_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Cuadrilla_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Cuadrilla> GetByPresupuesto(string sortExpression, Scope s, string Apu_Presupuesto_Id,string Estado)
        {
            List<Apu_Presupuesto_Cuadrilla> lista = new List<Apu_Presupuesto_Cuadrilla>(Adapter.Apu_Presupuesto_Cuadrilla_GetByPresupuesto(s, Apu_Presupuesto_Id,Estado));
            lista.Sort(new Apu_Presupuesto_Cuadrilla_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuesto(Scope s, string Apu_Presupuesto_Id,string Estado)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Cuadrilla_GetByPresupuesto(s, Apu_Presupuesto_Id,Estado));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Presupuesto_Cuadrilla> GetByPlanilla(string sortExpression, Scope s,string Apu_Presupuesto_Id, string Fis_Planilla_Id, string Estado)
        {
            List<Apu_Presupuesto_Cuadrilla> lista = new List<Apu_Presupuesto_Cuadrilla>(Adapter.Apu_Presupuesto_Cuadrilla_GetByPlanilla(s,Apu_Presupuesto_Id, Fis_Planilla_Id, Estado));
            lista.Sort(new Apu_Presupuesto_Cuadrilla_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPlanilla(Scope s,string Apu_Presupuesto_Id, string Fis_Planilla_Id, string Estado)
        {
            return EntidadDT.GetDT(Adapter.Apu_Presupuesto_Cuadrilla_GetByPlanilla(s,Apu_Presupuesto_Id, Fis_Planilla_Id, Estado));
        }

        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Presupuesto_Cuadrilla
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Presupuesto_Cuadrilla o, Apu_Presupuesto_Cuadrilla original)
        {
            return Adapter.Apu_Presupuesto_Cuadrilla_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Cuadrilla o = new Apu_Presupuesto_Cuadrilla();
            Apu_Presupuesto_Cuadrilla original = new Apu_Presupuesto_Cuadrilla();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Cuadrilla
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Presupuesto_Cuadrilla o)
        {
            return Adapter.Apu_Presupuesto_Cuadrilla_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Cuadrilla o = new Apu_Presupuesto_Cuadrilla();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Presupuesto_Cuadrilla
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Presupuesto_Cuadrilla o)
        {
            return Adapter.Apu_Presupuesto_Cuadrilla_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Presupuesto_Cuadrilla original = new Apu_Presupuesto_Cuadrilla();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Apu_Presupuesto_Cuadrilla_Comparar : IComparer<Apu_Presupuesto_Cuadrilla>
        {
            private string _sortColumn;
            private bool _reverse;
            public Apu_Presupuesto_Cuadrilla_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Apu_Presupuesto_Cuadrilla x, Apu_Presupuesto_Cuadrilla y)
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
