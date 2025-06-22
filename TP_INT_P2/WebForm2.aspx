






        <nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
            <div class="container-fluid">

                <a class="navbar-brand" href="#">
                    <img src="/imagenes/site/logo-utn-siglas.png" alt="Alternate Text" width="100px" style="filter: invert(1);"/>
                    Clínica TUP</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContenido">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                
                <div class="collapse navbar-collapse" id="navbarContenido">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0">

                        <li class="nav-item mx-3">
                                <a class='<%: "nav-link fs-4 "  + (Request.Url.AbsolutePath.Contains("Inicio") ? "active" : "") %>' href="Inicio.aspx">Inicio</a>
                        </li>
                        <li class='<%:  "nav-item mx-3 " + (Request.Url.AbsolutePath.Contains("ListadoMedicos") ? "active" : "") %>' >
                            <a class='<%: "nav-link fs-4 "  + (Request.Url.AbsolutePath.Contains("ListadoMedicos") ? "active" : "") %>' href="ListadoMedicos.aspx">Médicos</a>
                        </li>
                        <li class='<%: "nav-item mx-3 "   + (Request.Url.AbsolutePath.Contains("ListadoPacientes") ? "active" : "") %>'>
                            <a class='<%: "nav-link fs-4 "  + (Request.Url.AbsolutePath.Contains("ListadoPacientes") ? "active" : "") %>' href="ListadoPacientes.aspx">Pacientes</a>
                        </li>
                        <li class='<%: "nav-item mx-3 "  + (Request.Url.AbsolutePath.Contains("ListadoTurnos") ? "active" : "") %>'>
                            <a class='<%: "nav-link fs-4 "  + (Request.Url.AbsolutePath.Contains("ListadoTurnos") ? "active" : "") %>' href="ListadoTurnos.aspx">Turnos</a>
                        </li>
                        <li class='<%: "nav-item mx-3 "  + (Request.Url.AbsolutePath.Contains("Informes") ? "active" : "") %>'>
                            <a class='<%: "nav-link fs-4 "  + (Request.Url.AbsolutePath.Contains("Informes") ? "active" : "") %>' href="Informes.aspx">Informes</a>
                        </li>

                    <!-- Usuario logueado -->
                        <li class="nav-item mx-3 ">
                            <ul id="menudesplegado" class="">
                                  <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
                                        <asp:Label ID="lblFullName" runat="server" Text="Invitado" />
                                    </a>
                                    <ul class="dropdown-menu ">
                                      <li><asp:LinkButton ID="cambiarTema" runat="server" OnClick="cambiarTema_Click"> 
                                          <i class="fa-solid fa-circle-half-stroke"></i> <span id="cambiarTemaText">Cambiar Tema</span>
                                          </asp:LinkButton>
                                      </li>
                                      <li>
                                          <a class="dropdown-item" href="#">Another action</a>
                                      </li>
                                      <li>
                                          <a class="dropdown-item" href="#">Something else here</a>
                                      </li>
                                      <li>
                                          <hr class="dropdown-divider">
                                      </li>
                                      <li>
                                          <asp:Label ID="lblUsuario" runat="server" Text="Usuario: Invitado" CssClass="dropdown-item"/>
                                      </li>
                                      <li>
                                          <asp:LinkButton ID="cerrarSesion" runat="server" Visible="False" OnClick="cerrarSesion_Click" CssClass="dropdown-item">Cerrar Sesión
                                          </asp:LinkButton>
                                      </li>
                                    </ul>
                                </li>
                            </ul>
                            
                        </li>
                    </ul>
                    <%--<span class="navbar-text text-white">--%>
                        <%--<asp:Label ID="lblFullName" runat="server" Text="" /> --%>
                        <%--(<asp:Label ID="lblUsuario" runat="server" Text="Usuario: Invitado" />)--%> 
                        <%--<asp:LinkButton ID="cerrarSesion" runat="server" Visible="False" OnClick="cerrarSesion_Click">Cerrar Sesión</asp:LinkButton>--%>
                        <%--<asp:LinkButton ID="cambiarTema" runat="server" OnClick="cambiarTema_Click"> <i class="fa-solid fa-circle-half-stroke"></i> <span id="cambiarTemaText">Cambiar Tema</span></asp:LinkButton>--%>
                    <%--</span>--%>
                </div>
            </div>
        </nav>