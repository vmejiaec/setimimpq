
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
using System;
namespace FEL.FIS
{
    /// <summary>
    /// Acceso a los Web Services WS_FIS
    /// Modulo: Fiscalizaci
    /// Tabla: Fis_Planilla
    /// </summary>
    [DataObject]
    public class BO_Fis_Planilla
    {
        #region  Adapter
        private WS_FIS _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_FIS Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_FIS();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla> Get(string sortExpression, Scope s, string Apu_Presupuesto_Codigo_Institucional, string Apu_Presupuesto_Nombre, string Contratista_Per_Personal_Nombre, string Numero_Planilla_Desde, string Numero_Planilla_Hasta, DateTime Fecha_Inicial_Desde, DateTime Fecha_Final_Hasta, string Tipo_Planilla, decimal Total_Desde, decimal Total_Hasta, DateTime Fecha_Pago_Desde, DateTime Fecha_Pago_Hasta)
        {
            List<Fis_Planilla> lista = new List<Fis_Planilla>(Adapter.Fis_Planilla_Get(s, Apu_Presupuesto_Codigo_Institucional, Apu_Presupuesto_Nombre, Contratista_Per_Personal_Nombre, Numero_Planilla_Desde, Numero_Planilla_Hasta, Fecha_Inicial_Desde, Fecha_Final_Hasta, Tipo_Planilla, Total_Desde, Total_Hasta, Fecha_Pago_Desde, Fecha_Pago_Hasta));
            lista.Sort(new Fis_Planilla_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s, string Apu_Presupuesto_Codigo_Institucional, string Apu_Presupuesto_Nombre, string Contratista_Per_Personal_Nombre, string Numero_Planilla_Desde, string Numero_Planilla_Hasta, DateTime Fecha_Inicial_Desde, DateTime Fecha_Final_Hasta, string Tipo_Planilla, decimal Total_Desde, decimal Total_Hasta, DateTime Fecha_Pago_Desde, DateTime Fecha_Pago_Hasta)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Get(s, Apu_Presupuesto_Codigo_Institucional, Apu_Presupuesto_Nombre, Contratista_Per_Personal_Nombre, Numero_Planilla_Desde, Numero_Planilla_Hasta, Fecha_Inicial_Desde, Fecha_Final_Hasta, Tipo_Planilla, Total_Desde, Total_Hasta, Fecha_Pago_Desde, Fecha_Pago_Hasta));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Planilla> lista = new List<Fis_Planilla>(Adapter.Fis_Planilla_GetById(s, Id));
            lista.Sort(new Fis_Planilla_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla> GetByPresupuesto(string sortExpression, Scope s, string Apu_Presupuesto_Id)
        {
            List<Fis_Planilla> lista = new List<Fis_Planilla>(Adapter.Fis_Planilla_GetByPresupuesto(s, Apu_Presupuesto_Id));
            lista.Sort(new Fis_Planilla_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_GetByPresupuesto(s, Apu_Presupuesto_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Fis_Planilla> lista = new List<Fis_Planilla>(Adapter.Fis_Planilla_GetByCodigo(s, Codigo));
            lista.Sort(new Fis_Planilla_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_GetByCodigo(s, Codigo));
        }

        #region Procedimiento Select  UNI  denominado TotalPaginas
        public int TotalPaginas(Scope s, string Apu_Presupuesto_Codigo_Institucional, string Apu_Presupuesto_Nombre, string Contratista_Per_Personal_Nombre, string Numero_Planilla_Desde, string Numero_Planilla_Hasta, DateTime Fecha_Inicial_Desde, DateTime Fecha_Final_Hasta, string Tipo_Planilla, decimal Total_Desde, decimal Total_Hasta, DateTime Fecha_Pago_Desde, DateTime Fecha_Pago_Hasta)
        {
            return Adapter.Fis_Planilla_TotalPaginas(s,Apu_Presupuesto_Codigo_Institucional,Apu_Presupuesto_Nombre,Contratista_Per_Personal_Nombre,Numero_Planilla_Desde,Numero_Planilla_Hasta,Fecha_Inicial_Desde,Fecha_Final_Hasta,Tipo_Planilla,Total_Desde,Total_Hasta,Fecha_Pago_Desde,Fecha_Pago_Hasta);
        }
        #endregion
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Fis_Planilla
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Fis_Planilla o, Fis_Planilla original)
        {
            return Adapter.Fis_Planilla_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Planilla o = new Fis_Planilla();
            Fis_Planilla original = new Fis_Planilla();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Fis_Planilla
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Fis_Planilla o)
        {
            return Adapter.Fis_Planilla_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Planilla o = new Fis_Planilla();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Fis_Planilla
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Fis_Planilla o)
        {
            return Adapter.Fis_Planilla_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Planilla original = new Fis_Planilla();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }

        //***

        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int UpdateEstadoPago(Scope s, String Id, String EstadoPago)
        {
            return Adapter.Fis_PlanillaPago_Update(s, Id, EstadoPago);
        }
        
        //***

        #endregion
        #region Ordenar la lista
        class Fis_Planilla_Comparar : IComparer<Fis_Planilla>
        {
            private string _sortColumn;
            private bool _reverse;
            public Fis_Planilla_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Fis_Planilla x, Fis_Planilla y)
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
