using System;
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
    /// Tabla: Apu_Proyecto_Rubro_Equipo
    /// </summary>
    [DataObject]
    public class BO_Apu_Proyecto_Rubro_Equipo
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
        public List<Apu_Proyecto_Rubro_Equipo> Get(string sortExpression, Scope s)
        {
            List<Apu_Proyecto_Rubro_Equipo> lista =
                new List<Apu_Proyecto_Rubro_Equipo>(Adapter.Apu_Proyecto_Rubro_Equipo_Get(s));
            lista.Sort(new Apu_Proyecto_Rubro_Equipo_Comparar(sortExpression));
            return lista;
        }

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_Equipo_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Proyecto_Rubro_Equipo> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Apu_Proyecto_Rubro_Equipo> lista =
                new List<Apu_Proyecto_Rubro_Equipo>(Adapter.Apu_Proyecto_Rubro_Equipo_GetByCodigo(s, Codigo));
            lista.Sort(new Apu_Proyecto_Rubro_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_Equipo_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Proyecto_Rubro_Equipo> GetById(string sortExpression, Scope s, string Id)
        {
            List<Apu_Proyecto_Rubro_Equipo> lista =
                new List<Apu_Proyecto_Rubro_Equipo>(Adapter.Apu_Proyecto_Rubro_Equipo_GetById(s, Id));
            lista.Sort(new Apu_Proyecto_Rubro_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_Equipo_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Proyecto_Rubro_Equipo> GetByRubro(string sortExpression, Scope s, string Apu_Proyecto_Rubro_Id)
        {
            List<Apu_Proyecto_Rubro_Equipo> lista =
                new List<Apu_Proyecto_Rubro_Equipo>(
                    Adapter.Apu_Proyecto_Rubro_Equipo_GetByRubro(s, Apu_Proyecto_Rubro_Id));
            lista.Sort(new Apu_Proyecto_Rubro_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByRubro(Scope s, string Apu_Proyecto_Rubro_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_Equipo_GetByRubro(s, Apu_Proyecto_Rubro_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Proyecto_Rubro_Equipo> GetByProyecto(string sortExpression, Scope s, string Apu_Proyecto_Id)
        {
            List<Apu_Proyecto_Rubro_Equipo> lista = new List<Apu_Proyecto_Rubro_Equipo>(Adapter.Apu_Proyecto_Rubro_Equipo_GetByProyecto(s, Apu_Proyecto_Id));
            lista.Sort(new Apu_Proyecto_Rubro_Equipo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_Equipo_GetByProyecto(s, Apu_Proyecto_Id));
        }

        #region Procedimiento Select  UNI  denominado ExisteEquipo

        public int ExisteEquipo(Scope s, string Apu_Equipo_Id, string Apu_Proyecto_Rubro_Id)
        {
            return Adapter.Apu_Proyecto_Rubro_Equipo_ExisteEquipo(s, Apu_Equipo_Id, Apu_Proyecto_Rubro_Id);
        }

        #endregion

        #endregion

        #region Operacion entre datos

        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Proyecto_Rubro_Equipo o, Apu_Proyecto_Rubro_Equipo original)
        {
            return Adapter.Apu_Proyecto_Rubro_Equipo_Update(s, o, original);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Proyecto_Rubro_Equipo o = new Apu_Proyecto_Rubro_Equipo();
            Apu_Proyecto_Rubro_Equipo original = new Apu_Proyecto_Rubro_Equipo();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }

        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Proyecto_Rubro_Equipo o)
        {
            o.Fecha_Creacion = DateTime.Now;
            o.Fecha_Update = DateTime.Now;
            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            return Adapter.Apu_Proyecto_Rubro_Equipo_Insert(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Proyecto_Rubro_Equipo o = new Apu_Proyecto_Rubro_Equipo();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }

        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Proyecto_Rubro_Equipo o)
        {
            return Adapter.Apu_Proyecto_Rubro_Equipo_Delete(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Proyecto_Rubro_Equipo original = new Apu_Proyecto_Rubro_Equipo();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }

        #endregion

        #region Ordenar la lista

        private class Apu_Proyecto_Rubro_Equipo_Comparar : IComparer<Apu_Proyecto_Rubro_Equipo>
        {
            private bool _reverse;
            private string _sortColumn;

            public Apu_Proyecto_Rubro_Equipo_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }

            #region IComparer<Apu_Proyecto_Rubro_Equipo> Members

            public int Compare(Apu_Proyecto_Rubro_Equipo x, Apu_Proyecto_Rubro_Equipo y)
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
                return (retVal*(_reverse ? -1 : 1));
            }

            #endregion
        }

        #endregion
    }
}