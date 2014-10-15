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
    public class DO_Pla_Partida
    {
	// adapter
    public Pla_PartidaTableAdapter Adapter = new Pla_PartidaTableAdapter();
	//Select
	public List<Pla_Partida> Get(Scope s)
    {
        List<Pla_Partida> lista = new List<Pla_Partida>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Partida(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Partida n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Nombre,
n.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Partida o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Nombre,
o.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Partida o, Pla_Partida n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Nombre,
n.Estado,
o.Id,
o.Codigo,
o.Nombre,
o.Estado,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_Partida> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Partida> lista = new List<Pla_Partida>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Partida(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado
				));
			}
			return lista;
		}
		// GetByLikeCodigo
		public List<Pla_Partida> GetByLikeCodigo (Scope s , string p_Codigo)
		{
			List<Pla_Partida> lista = new List<Pla_Partida>();
			var tabla = Adapter.GetByLikeCodigo( p_Codigo);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Partida(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado
				));
			}
			return lista;
		}
		// GetByLikeNombre
		public List<Pla_Partida> GetByLikeNombre (Scope s , string p_Nombre)
		{
			List<Pla_Partida> lista = new List<Pla_Partida>();
			var tabla = Adapter.GetByLikeNombre( p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Partida(
				fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Partida n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Codigo,
n.Nombre,
n.Estado
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
