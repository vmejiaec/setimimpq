﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.PlanificacionTableAdapters;
using AEL.PLA;
using BEL;
using System.Data.SqlClient;

namespace CEL.PLA
{
    public class DO_Pla_Poa
    {
	// adapter
    public Pla_PoaTableAdapter Adapter = new Pla_PoaTableAdapter();
	//Select
	public List<Pla_Poa> Get(Scope s)
    {
        List<Pla_Poa> lista = new List<Pla_Poa>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Poa(
				fila.Id,
fila.Codigo,
fila.Pla_Tarea_Id,
fila.Pla_Partida_Id,
fila.Estado,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Poa n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Codigo,
n.Pla_Tarea_Id,
n.Pla_Partida_Id,
n.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Poa o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Codigo,
o.Pla_Tarea_Id,
o.Pla_Partida_Id,
o.Estado
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Poa o, Pla_Poa n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Codigo,
n.Pla_Tarea_Id,
n.Pla_Partida_Id,
n.Estado,
o.Id,
o.Codigo,
o.Pla_Tarea_Id,
o.Pla_Partida_Id,
o.Estado,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_Poa> GetById (Scope s  Int32 p_Id)
		{
			List<Pla_Poa> lista = new List<Pla_Poa>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Poa(
				fila.Id,
fila.Codigo,
fila.Pla_Tarea_Id,
fila.Pla_Partida_Id,
fila.Estado,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre
				));
			}
			return lista;
		}
		// GetByPla_Partida_Id
		public List<Pla_Poa> GetByPla_Partida_Id (Scope s  Int32 p_Pla_Partida_Id)
		{
			List<Pla_Poa> lista = new List<Pla_Poa>();
			var tabla = Adapter.GetByPla_Partida_Id( p_Pla_Partida_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Poa(
				fila.Id,
fila.Codigo,
fila.Pla_Tarea_Id,
fila.Pla_Partida_Id,
fila.Estado,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre
				));
			}
			return lista;
		}
		// GetByPla_Tarea_Id
		public List<Pla_Poa> GetByPla_Tarea_Id (Scope s  Int32 p_Pla_Tarea_Id)
		{
			List<Pla_Poa> lista = new List<Pla_Poa>();
			var tabla = Adapter.GetByPla_Tarea_Id( p_Pla_Tarea_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Poa(
				fila.Id,
fila.Codigo,
fila.Pla_Tarea_Id,
fila.Pla_Partida_Id,
fila.Estado,
fila.Pla_Tarea_Codigo,
fila.Pla_Tarea_Nombre,
fila.Pla_Cta_Id,
fila.Pla_Cta_Codigo,
fila.Pla_Cta_Nombre,
fila.Pla_Partida_Codigo,
fila.Pla_Partida_Nombre
				));
			}
			return lista;
		}
	}
}
