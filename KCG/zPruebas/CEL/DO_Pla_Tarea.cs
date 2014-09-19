using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.PlanificacionTableAdapters;
using AEL.PLA;
using BEL;
using System.Data.SqlClient;

namespace CEL.PLA
{
    public class DO_Pla_Tarea
    {
	// adapter
    public Pla_TareaTableAdapter Adapter = new Pla_TareaTableAdapter();
	//Select
	public List<Pla_Tarea> Get(Scope s)
    {
        List<Pla_Tarea> lista = new List<Pla_Tarea>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Scope s, Pla_Tarea n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Pla_Cta_Id,
n.Nombre,
n.Fecha_Ini,
n.Fecha_Fin,
n.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Scope s, Pla_Tarea o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Pla_Cta_Id,
o.Nombre,
o.Fecha_Ini,
o.Fecha_Fin,
o.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Scope s, Pla_Tarea o, Pla_Tarea n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Pla_Cta_Id,
n.Nombre,
n.Fecha_Ini,
n.Fecha_Fin,
n.Estado,
o.Id,
o.Codigo,
o.Pla_Cta_Id,
o.Nombre,
o.Fecha_Ini,
o.Fecha_Fin,
o.Estado,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_Tarea> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado
				));
			}
			return lista;
		}
		// GetByPla_Cta_Id
		public List<Pla_Tarea> GetByPla_Cta_Id (Scope s , Int32 p_Pla_Cta_Id)
		{
			List<Pla_Tarea> lista = new List<Pla_Tarea>();
			var tabla = Adapter.GetByPla_Cta_Id( p_Pla_Cta_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Tarea(
				fila.Id,
fila.Codigo,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Cta_Nivel,
fila.Nombre,
fila.Fecha_Ini,
fila.Fecha_Fin,
fila.Estado
				));
			}
			return lista;
		}
	}
}
