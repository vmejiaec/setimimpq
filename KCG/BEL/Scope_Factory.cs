using System.Collections.Specialized;
using System.Text;

namespace BEL
{
    public class Scope_Factory
    {
        public static Scope Get(NameValueCollection solicitud)
        {
            Scope s = new Scope();
            s.Ver_Version_Id = solicitud.Get("Ver_Version_Id");
            s.Ver_Version_Nombre = solicitud.Get("Ver_Version_Nombre");
            s.Int_Empresa_Id = solicitud.Get("Int_Empresa_Id");
            s.Int_Empresa_Nombre = solicitud.Get("Int_Empresa_Nombre");
            //s.Empresa_Id_Ref = solicitud.Get("Empresa_Id_Ref");
            s.Int_Sucursal_Id = solicitud.Get("Int_Sucursal_Id");
            s.Int_Sucursal_Nombre = solicitud.Get("Int_Sucursal_Nombre");
            s.Seg_Rol_Id = solicitud.Get("Seg_Rol_Id");
            s.Seg_Rol_Nombre = solicitud.Get("Seg_Rol_Nombre");
            s.Int_Usuario_Id = solicitud.Get("Int_Usuario_Id");
            s.Int_Usuario_Nombre = solicitud.Get("Int_Usuario_Nombre");
            s.Password = solicitud.Get("Password");
            s.Per_Personal_Id = solicitud.Get("Per_Personal_Id");
            s.Per_Personal_Nombre = solicitud.Get("Per_Personal_Nombre");
            s.Per_Personal_Id = solicitud.Get("Per_Personal_Id");
            // Controla que tenga valores minimos 
            s.Ver_Version_Id = s.Ver_Version_Id ?? "1";
            s.Int_Empresa_Id = s.Int_Empresa_Id ?? "1";
            s.Int_Empresa_Nombre = s.Int_Empresa_Nombre ?? "Empresa nombre";
            s.Int_Sucursal_Nombre = s.Int_Sucursal_Nombre ?? "Sucursal nombre";
            s.Int_Usuario_Nombre = s.Int_Usuario_Nombre ?? "Usuario nombre";
            s.Per_Personal_Nombre = s.Per_Personal_Nombre ?? "Personal Nombre";
            s.Per_Personal_Id = s.Per_Personal_Id ?? "Personal Id";
            return s;
        }

        public static string Get_QueryString(Scope s)
        {
            StringBuilder cadena = new StringBuilder("?");

            cadena.Append(string.Format("Ver_Version_Id={0}&", s.Ver_Version_Id));
            cadena.Append(string.Format("Ver_Version_Nombre={0}&", s.Ver_Version_Nombre));
            cadena.Append(string.Format("Int_Empresa_Id={0}&", s.Int_Empresa_Id));
            cadena.Append(string.Format("Int_Empresa_Nombre={0}&", s.Int_Empresa_Nombre));
            //cadena.Append(string.Format("Empresa_Id_Ref={0}&", s.Empresa_Id_Ref));
            cadena.Append(string.Format("Int_Sucursal_Id={0}&", s.Int_Sucursal_Id));
            cadena.Append(string.Format("Int_Sucursal_Nombre={0}&", s.Int_Sucursal_Nombre));
            cadena.Append(string.Format("Seg_Rol_Id={0}&", s.Seg_Rol_Id));
            cadena.Append(string.Format("Seg_Rol_Nombre={0}&", s.Seg_Rol_Nombre));
            cadena.Append(string.Format("Int_Usuario_Id={0}&", s.Int_Usuario_Id));
            cadena.Append(string.Format("Int_Usuario_Nombre={0}&", s.Int_Usuario_Nombre));
            cadena.Append(string.Format("Password={0}&", s.Password));
            cadena.Append(string.Format("Per_Personal_Id={0}&", s.Per_Personal_Id));
            cadena.Append(string.Format("Per_Personal_Nombre={0}&", s.Per_Personal_Nombre));
            cadena.Append(string.Format("Per_Personal_Id={0}", s.Per_Personal_Id));

            return cadena.ToString();
        }
    }
}