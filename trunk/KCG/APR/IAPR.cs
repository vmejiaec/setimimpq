using System;
using System.Collections.Generic;
using System.Text;
using AEL;
using BEL;

namespace APR
{
    public interface IAPR
    {
        bool Atras(Scope s, object p_Objeto, string p_Proceso);
        bool Adelante(Scope s, object p_Objeto, string p_Proceso);
        bool Actualizar(Scope s, object p_Objeto_Original, object p_Objeto);
        bool Permiso(Scope s, object p_Objeto, string p_Proceso);
        object GetById(Scope s, string p_Id);
    }
}
