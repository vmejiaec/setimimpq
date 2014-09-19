using System;
using System.Collections.Generic;
using System.Text;
using AEL.APU;
using BEL;

namespace DEL.APU
{
    public class DO_Apu_Proyecto_Equipo_Indice
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Proyecto_Equipo_Indice _adpApu_Pro_Equ_Indice;
        private static CEL.APU.DO_Apu_Proyecto_Equipo_Indice adpApu_Pro_Equ_Indice
        {
            get
            {
                if (_adpApu_Pro_Equ_Indice == null)
                    _adpApu_Pro_Equ_Indice =
                        new CEL.APU.DO_Apu_Proyecto_Equipo_Indice();
                return _adpApu_Pro_Equ_Indice;
            }
        }
        #endregion

        #region Operación con datos
        public static string Insert(Scope s, Apu_Proyecto_Equipo_Indice o)
        {
            
            adpApu_Pro_Equ_Indice.Adapter.BeginTransaction();
            // Inserto el índice
            String Id = adpApu_Pro_Equ_Indice.Insert(s, o);
            // Consulta todos los índices del equipo en el proyecto
            List<Apu_Proyecto_Equipo_Indice> lista =
                adpApu_Pro_Equ_Indice.GetByProyectoEquipo(
                    s,
                    o.Apu_Proyecto_Equipo_Id);
            // Obtenemos la diferencia de 100% y la posición del mayor
            Decimal diferencia = 100.0M;
            Decimal mayor_valor = -1.0M;
            int mayor_id = -1;
            for (int i = 0; i< lista.Count; i++)
            {
                diferencia -= lista[i].Apu_Indice_Equipo_Porcentaje;
                if (lista[i].Apu_Indice_Equipo_Porcentaje > mayor_valor)
                {
                    mayor_valor = lista[i].Apu_Indice_Equipo_Porcentaje;
                    mayor_id = i;
                }
            }
            if (mayor_id != -1)
            {
                // Clonamos los índices antes de modificarlos
                List <Apu_Proyecto_Equipo_Indice> original = 
                    new List<Apu_Proyecto_Equipo_Indice>();
                foreach (Apu_Proyecto_Equipo_Indice ind in lista)
                {
                    original.Add(new Apu_Proyecto_Equipo_Indice(ind));
                    ind.Porcentaje = ind.Apu_Indice_Equipo_Porcentaje;
                }
                // Modificamos con la diferencia al de mayor porcentaje
                lista[mayor_id].Porcentaje = 
                    lista[mayor_id].Apu_Indice_Equipo_Porcentaje + diferencia;
                // Actualizamos los índices
                for (int i = 0; i < lista.Count; i++)
                {
                    adpApu_Pro_Equ_Indice.Update(
                    s,
                    lista[i],
                    original[i]);
                }
            }
            //Retorna el Id Insetado
            return Id;
        }

        public static int Delete(Scope s, Apu_Proyecto_Equipo_Indice o)
        {
            // Borro el índice
            int resultado = adpApu_Pro_Equ_Indice.Delete(s, o);
            // Consulta todos los índices del equipo en el proyecto
            List<Apu_Proyecto_Equipo_Indice> lista =
                adpApu_Pro_Equ_Indice.GetByProyectoEquipo(
                    s,
                    o.Apu_Proyecto_Equipo_Id);
            // Obtenemos la diferencia de 100% y la posición del mayor
            Decimal diferencia = 100.0M;
            Decimal mayor_valor = -1.0M;
            int mayor_id = -1;
            for (int i = 0; i < lista.Count; i++)
            {
                diferencia -= lista[i].Apu_Indice_Equipo_Porcentaje;
                if (lista[i].Apu_Indice_Equipo_Porcentaje > mayor_valor)
                {
                    mayor_valor = lista[i].Apu_Indice_Equipo_Porcentaje;
                    mayor_id = i;
                }
            }
            if (mayor_id != -1)
            {
                // Clonamos los índices antes de modificarlos
                List<Apu_Proyecto_Equipo_Indice> original =
                    new List<Apu_Proyecto_Equipo_Indice>();
                foreach (Apu_Proyecto_Equipo_Indice ind in lista)
                {
                    original.Add(new Apu_Proyecto_Equipo_Indice(ind));
                    ind.Porcentaje = ind.Apu_Indice_Equipo_Porcentaje;
                }
                // Modificamos con la diferencia al de mayor porcentaje
                lista[mayor_id].Porcentaje =
                    lista[mayor_id].Apu_Indice_Equipo_Porcentaje + diferencia;
                // Actualizamos los índices
                for (int i = 0; i < lista.Count; i++)
                {
                    adpApu_Pro_Equ_Indice.Update(
                    s,
                    lista[i],
                    original[i]);
                }
            }
            //Retorna el resultado
            return resultado;
        }
        #endregion
    }
}
