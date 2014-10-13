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
    public class DO_Pla_Mov
    {
	// adapter
    public Pla_MovTableAdapter Adapter = new Pla_MovTableAdapter();
	//Select
	public List<Pla_Mov> Get(Scope s)
    {
        List<Pla_Mov> lista = new List<Pla_Mov>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Mov(
				fila.Id,
fila.Codigo,
fila.Pla_Poa_Id,
fila.Pla_Doc_Id,
fila.Orden,
fila.Valor,
fila.Estado,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Nombre,
fila.Pla_Partida_Id,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre,
fila.Pla_Doc_Tipo,
fila.Pla_Doc_Fecha
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Mov n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Pla_Poa_Id,
n.Pla_Doc_Id,
n.Orden,
n.Valor,
n.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Mov o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Pla_Poa_Id,
o.Pla_Doc_Id,
o.Orden,
o.Valor,
o.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Mov o, Pla_Mov n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Pla_Poa_Id,
n.Pla_Doc_Id,
n.Orden,
n.Valor,
n.Estado,
o.Id,
o.Codigo,
o.Pla_Poa_Id,
o.Pla_Doc_Id,
o.Orden,
o.Valor,
o.Estado,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_Mov> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Mov> lista = new List<Pla_Mov>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Mov(
				fila.Id,
fila.Codigo,
fila.Pla_Poa_Id,
fila.Pla_Doc_Id,
fila.Orden,
fila.Valor,
fila.Estado,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Nombre,
fila.Pla_Partida_Id,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre,
fila.Pla_Doc_Tipo,
fila.Pla_Doc_Fecha
				));
			}
			return lista;
		}
		// GetByPla_Doc_Id
		public List<Pla_Mov> GetByPla_Doc_Id (Scope s , Int32 p_Pla_Doc_Id)
		{
			List<Pla_Mov> lista = new List<Pla_Mov>();
			var tabla = Adapter.GetByPla_Doc_Id( p_Pla_Doc_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Mov(
				fila.Id,
fila.Codigo,
fila.Pla_Poa_Id,
fila.Pla_Doc_Id,
fila.Orden,
fila.Valor,
fila.Estado,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Nombre,
fila.Pla_Partida_Id,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre,
fila.Pla_Doc_Tipo,
fila.Pla_Doc_Fecha
				));
			}
			return lista;
		}
		// GetByPla_Poa_Id
		public List<Pla_Mov> GetByPla_Poa_Id (Scope s , Int32 p_Pla_Poa_Id)
		{
			List<Pla_Mov> lista = new List<Pla_Mov>();
			var tabla = Adapter.GetByPla_Poa_Id( p_Pla_Poa_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Mov(
				fila.Id,
fila.Codigo,
fila.Pla_Poa_Id,
fila.Pla_Doc_Id,
fila.Orden,
fila.Valor,
fila.Estado,
fila.Pla_Tarea_Id,
fila.Pla_Tarea_Nombre,
fila.Pla_Partida_Id,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre,
fila.Pla_Doc_Tipo,
fila.Pla_Doc_Fecha
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Mov n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Codigo,
n.Pla_Poa_Id,
n.Pla_Doc_Id,
n.Orden,
n.Valor,
n.Estado
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
