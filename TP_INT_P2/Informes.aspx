<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="TP_INT_P2.Informes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .progress {
      height: 30px;
    }
    .progress-bar {
      transition: width 1.5s ease-in-out;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class="text-center my-4 py-4"><i class="fa-solid fa-file-contract"></i> Informes</h2>


        <hr class="my-4">
    <h3 class="text-primary">Turnos con Ausente</h3>
    <div class="row"> <%--// TURNOS con Ausentes --%>

            <div class="container px-3">
      <div class="row align-items-end g-2 mb-3">

        <!-- Desde -->
        <div class="col-sm-2">
          <label for="txtInformeDesde" class="form-label">Desde:</label>
      
            <asp:TextBox ID="txtInformeDesde" runat="server" Text="Inicio" CssClass="form-control datepicker"></asp:TextBox>
        
        </div>

        <!-- Hasta -->
        <div class="col-sm-2">
          <label for="txtInformeHasta" class="form-label">Hasta:</label>
            <asp:TextBox ID="txtInformeHasta" runat="server" Text="Fin" CssClass="form-control datepicker"></asp:TextBox>
        </div>
        <div class="col-sm-auto">
            <label class="form-label d-block invisible">.</label>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary form-control" OnClick="btnBuscar_Click" />
        </div>

        <div class="col-sm-auto">
          <label class="form-label d-block invisible">.</label>
          <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary form-control" OnClick="btnReset_Click" />
        </div>
      </div>
    </div>


        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos con Ausente</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalTurnosAusentes" runat="server" Text=""></asp:Label>   
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Porcentaje de Turnos con Ausente</h4>
            <p class="fs-5">
                <asp:Label ID="lblPorcentajeTurnosAusentes" runat="server" Text=""></asp:Label> 
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos Ausentes por Médico</h4>
            <p class="fs-5">
                <asp:GridView ID="gvTotalTurnosAusentesPorMedico" runat="server" CellPadding="3" BorderWidth="0">
                    <EmptyDataTemplate>
                        <div class=" text-center" role="alert">
                            No se encontraron datos para mostrar
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </p>
        </div>


     </div>



    <hr class="my-4">
    <h3 class="text-primary">Médicos</h3>

    <div class="row"> <%--// MEDICOS--%>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Medicos Totales</h4>
                <p class="fs-5">
                    <asp:Label ID="lblTotalMedicos" runat="server" Text=""></asp:Label> 
                    

                </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Médicos Activos</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalMedicosActivos" runat="server" Text=""></asp:Label> 
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Médicos Inactivos</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalMedicosInactivos" runat="server" Text=""></asp:Label>
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Medicos con Turnos</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalMedicosConTurnos" runat="server" Text=""></asp:Label>
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Porcentaje de médicos con turnos</h4>
            <p class="fs-5">
                <asp:Label ID="lblPorcentajeMedicosConTurnosSobreMedicosActivos" runat="server" Text=""></asp:Label>
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Médicos por Especialidad</h4>
            <p class="fs-5">
                <asp:GridView ID="gvTotalMedicosPorEspecialidad" runat="server" CellPadding="3" BorderWidth="0">
                    <EmptyDataTemplate>
                        <div class=" text-center" role="alert">
                            No se encontraron datos para mostrar
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView> 
                
            </p>
        </div>
    </div>
    
    <hr class="my-4">
    <h3 class="text-primary">Horarios</h3>

<div class="row"> <%--// HORARIOS--%>
 
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Médico con Mayor Atención Semanal</h4>
            <p class="fs-5">
                <asp:Label ID="lblmedicoConMayorAtencionSemanalNombre" runat="server" Text=""></asp:Label> <asp:Label ID="lblmedicoConMayorAtencionSemanalApellido" runat="server" Text=""></asp:Label>
                
            </p>
        </div>
     

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos Semanales Habilitados</h4>
            <p class="fs-5">
                <asp:Label ID="lblTurnosSemanalesHabilitadosTotales" runat="server" Text=""></asp:Label>
                
            </p>
        </div>
    </div>

    <hr class="my-4">
    <h3 class="text-primary">Pacientes</h3>

    <div class="row"> <%--// PACIENTES--%>
        
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalPacientes" runat="server" Text=""></asp:Label>  
                </p>
        </div>
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Activos</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalPacientesActivos" runat="server" Text=""></asp:Label>
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Inactivos</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalPacientesInactivos" runat="server" Text=""></asp:Label>
                
            </p>
        </div>
    </div>

    <hr class="my-4">
    <h3 class="text-primary">Pacientes por edad</h3>

    <div class="row"> <%--// PACIENTES POR EDAD --%>          
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Adultos Mayores</h4>
            <p class="fs-5">
                <asp:Label ID="lblPacientesAdultosMayores" runat="server" Text=""></asp:Label> 
                
            </p>
        </div>
                      

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Adultos</h4>
            <p class="fs-5">
                <asp:Label ID="lblPacientesAdultos" runat="server" Text=""></asp:Label>   
                 
            </p>
        </div>
                           

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Juveniles</h4>
            <p class="fs-5">
                <asp:Label ID="lblPacientesJuveniles" runat="server" Text=""></asp:Label> 
                
            </p>
        </div>
                           

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Infantiles</h4>
            <p class="fs-5">
                <asp:Label ID="lblPacientesInfantiles" runat="server" Text=""></asp:Label>  
                
            </p>
        </div>
                          

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Preescolares</h4>
            <p class="fs-5">
                <asp:Label ID="lblPacientesPreescolares" runat="server" Text=""></asp:Label> 
                   
            </p>
        </div>
                    

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Pacientes Lactantes</h4>
            <p class="fs-5">
                <asp:Label ID="lblPacientesLactantes" runat="server" Text=""></asp:Label>
                
            </p>
        </div>
                          

       </div>

    


    <hr class="my-4">
    <h3 class="text-primary">Turnos</h3>

    <div class="row"> <%--// TURNOS--%>



        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalTurnos" runat="server" Text=""></asp:Label>  
                
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos pasados</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalTurnosPasados" runat="server" Text=""></asp:Label>    
                 
            </p>
        </div>

        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos Próx Semana</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalTurnosProximaSemana" runat="server" Text=""></asp:Label>  
                
            </p>
        </div>
                                  
        <div class="col-2 shadow mb-3 mx-3 p-3" style="">
            <h4>Turnos Futuros</h4>
            <p class="fs-5">
                <asp:Label ID="lblTotalTurnosFuturos" runat="server" Text=""></asp:Label>  
                 
            </p>
        </div>
     </div>



<%--            <div class="progress mt-3"><div class="progress-bar bg-info progress-bar-animated" role="progressbar" style="width: 0%;">0%</div></div>--%>

<%--Script para progress bar animacion--%>    
<script>
    window.addEventListener("load", function () {
        const bar = document.querySelector(".progress-bar");
        setTimeout(() => {
        const porcentaje = 90; // poné el valor que quieras acá
        bar.style.width = porcentaje + "%";
        bar.innerText = porcentaje + "%";
        }, 300); // pequeño retraso para mejor efecto
    });
</script>

<%-- Script que genera un mini calendario para elegir la fecha --%>
<script type="text/javascript">
    $(document).ready(function () {
        $('.datepicker')
            .datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true,
                todayHighlight: true
            })
            .on('keydown paste', function (e) {
                e.preventDefault(); // Bloquea escribir con teclado o pegar
            });
    });
</script>
</asp:Content>
