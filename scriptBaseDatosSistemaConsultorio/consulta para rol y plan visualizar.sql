
SELECT *
  FROM [DB_A1595D_DoctorMedicalWeb].[dbo].[Planes]


SELECT *
  FROM [DB_A1595D_DoctorMedicalWeb].[dbo].[PlanFormularios]

  SELECT *
  FROM [DB_A1595D_DoctorMedicalWeb].[dbo].[Formularios]




SELECT *
  FROM [DB_A1595D_DoctorMedicalWeb].[dbo].[Role]

SELECT *
  FROM [DB_A1595D_DoctorMedicalWeb].[dbo].[RolFormularios]


 
SELECT *
  FROM [DB_A1595D_DoctorMedicalWeb].[dbo].[Usuario]




--ver formularios de los planes   
SELECT *
  FROM [dbo].[Usuario] us
  left join dbo.Doctor do
  on us.UsuaSecuencia = do.UsuSecuencia
    left join dbo.Personal pe
  on us.UsuaSecuencia = pe.UsuaSecuencia
 left join [dbo].[Planes] pl
 on us.PlanSecuencia_fk = pl.PlanSecuencia
 left join dbo.Role ro
 on us.RoleSecuencia_fk=ro.RoleSecuencia
 left join dbo.PlanFormularios pf
 on us.PlanSecuencia_fk = pf.PlanSecuencia_fk
  where 
  --us.UsuaNombre like '%adm%'
  us.UsuaNombre like '%Melba%'
 us.UsuaNombre like '%YOCELIN%'
 --ver formularios de los roles   
 SELECT *
  FROM [dbo].[Usuario] us
  left join dbo.Doctor do
  on us.UsuaSecuencia = do.UsuSecuencia
    left join dbo.Personal pe
  on us.UsuaSecuencia = pe.UsuaSecuencia
 left join [dbo].[Planes] pl
 on us.PlanSecuencia_fk = pl.PlanSecuencia
 left join dbo.Role ro
 on us.RoleSecuencia_fk=ro.RoleSecuencia
  left join dbo.RolFormularios rf
 on us.RoleSecuencia_fk = rf.RoleSecuencia_fk
  where  
   --us.UsuaNombre like '%adm%'
  us.UsuaNombre like '%Melba%'
 us.UsuaNombre like '%YOCELIN%'





