create database bdpersona;
use bdpersona;

create table persona(
    ci int primary key,
    nombre varchar(30),
    apellidos varchar(50),
    sexo char(1),
    fecha_nacimiento date
	direccion varchar(50)
);
 
delimiter $
create procedure guardarPersona(
in id int, 
in nom varchar(30), 
in ape varchar(50),
in sex char(1),
in fec date,
in dir varchar(50)
)
begin
	insert into persona values(id, nom, ape, sex, fec, dir);
end $

delimiter $
create procedure modificarPersona(
in id int, 
in nom varchar(30), 
in ape varchar(50),
in sex char(1),
in fec date,
in dir varchar(50)
)
begin
	update persona set nombre=nom, apellidos=ape, sexo=sex, fecha_nacimiento=fec, direccion=dir
    where ci=id;
end $

delimiter $
create procedure eliminarPersona(in id int)
begin
	delete from persona where ci=id;
end $

delimiter $
create procedure buscarPersona(in buscar varchar(30))
begin	
	select *from persona where nombre like concat('%',buscar,'%');
end $

call guardarPersona(1, 'Daysi', 'Cossio', 'F', '2000-03-12');
call guardarPersona(2, 'Erwin', 'Barrientos', 'M', '1997-12-20');
call guardarPersona(3, 'Isacc', 'Checa', 'M', '1993-04-01');
call modificarPersona(3, 'Juan', 'Perez', 'M', '1993-02-12');

call buscarPersona ('juan');
call eliminarPersona(3);

select *from persona;

alter table persona add direccion varchar(50);

