<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Test2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="AppContainer" runat="server">

    <div class="apps">
            <div class="app-card-border">
                <div class="app-card">
                    <img src="Content/img/Layer 2.png" alt="layer-dots">
                    <img class="app-icon" src="Content/img/warnings-off2.png" alt="app-icon">
                    <div class="app-text">
                        <p>
                            ALERTS AND MESSAGING
                        </p>
                    </div>

                    <img class="app-botom-img" src="Content/img/Layer 3.png" alt="layer-dots">
                </div>
                <div class="notifications">
                    <p class="notification-number"><% int UnreadMessagescount = 0; foreach (var item in messages.Messages) { if (item.Read == "0") UnreadMessagescount++; } Response.Write(UnreadMessagescount); %></p>
                </div>
            </div>
            <div class="app-card-border">
                <div class="app-card">
                    <img src="Content/img/Layer 2.png" alt="layer-dots">
                    <img class="app-icon" src="Content/img/reminders-calendar.png" alt="app-icon">
                    <div class="app-text">
                        <p>
                            REMINDERS CALENDAR
                        </p>
                    </div>

                    <img class="app-botom-img" src="Content/img/Layer 3.png" alt="layer-dots">
                </div>
                <div class="notifications">
                    <p class="notification-number"><% int UndoneReminderscount = 0; foreach (var item in reminders.Reminders) { if (item.Done == "0") UndoneReminderscount++; } Response.Write(UndoneReminderscount); %></p>
                </div>
            </div>
            <div class="app-card-border">
                <div class="app-card">
                    <img src="Content/img/Layer 2.png" alt="layer-dots">
                    <img class="app-icon" src="Content/img/ties2.png" alt="app-icon">
                    <div class="app-text">
                        <p>
                            CIRCLE OF CARE
                        </p>
                    </div>

                    <img class="app-botom-img" src="Content/img/Layer 3.png" alt="layer-dots">
                </div>
                <div class="notifications">
                    <p class="notification-number">2</p>
                </div>
            </div>
            <div class="app-card-border">
                <div class="app-card">
                    <img src="Content/img/Layer 2.png" alt="layer-dots">
                    <img class="app-icon" src="Content/img/daily-care-o-gram.png" alt="app-icon">
                    <div class="app-text">
                        <p>
                            DAILY CARE-O-GRAM
                        </p>
                    </div>

                    <img class="app-botom-img" src="Content/img/Layer 3.png" alt="layer-dots">
                </div>
                <div class="notifications">
                    <p class="notification-number">1</p>
                </div>
            </div>
            <div class="app-card-border">
                <div class="app-card">
                    <img src="Content/img/Layer 2.png" alt="layer-dots">
                    <img class="app-icon" src="Content/img/casemanager.png" alt="app-icon">
                    <div class="app-text one-line">
                        <p>
                            REPOSITORY
                        </p>
                    </div>
                    <img class="app-botom-img" src="Content/img/Layer 3.png" alt="layer-dots">
                </div>
            </div>
            <div class="app-card-border">
                <div class="app-card">
                    <img src="Content/img/Layer 2.png" alt="layer-dots">
                    <img class="app-icon" src="Content/img/my-health-reports (1).png" alt="app-icon">
                    <div class="app-text one-line">
                        <p>
                            REPORTS
                        </p>
                    </div>
                    <img class="app-botom-img" src="Content/img/Layer 3.png" alt="layer-dots">
                </div>
            </div>
            <div class="app-card-border">
                <div class="app-card">
                    <img src="Content/img/Layer 2.png" alt="layer-dots">
                    <img class="app-icon my-points" src="Content/img/reward-points (1).png" alt="app-icon">
                    <div class="app-text one-line">
                        <p>
                            MY POINTS
                        </p>
                    </div>

                    <img class="app-botom-img" src="Content/img/Layer 3.png" alt="layer-dots">
                </div>
                <div class="score">
                    <p class="total-points">
                        Total Points
                        <span>725</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="alerts-messagin">
            <div class="title">
                <img src="Content/img/warnings-off2.png" alt="warning-icon">
                <p>
                    ALERTS AND MESSAGING
                </p>
            </div>
            <div class="block-content">
                <nav>
                    <ul>
                        <li>

                            <label class="input-container main">.
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </li>
                        <li>New Message</li>
                        <li>Inbox
                            <span class="notifications">
                                <p class="notification-number"><% Response.Write(UnreadMessagescount); %></p>
                            </span>
                        </li>
                        <li>Sent</li>
                    </ul>
                    <div class="search">
                        <div></div>
                        <input type="text" name="" id="" placeholder="Search ">
                        <i class="fas fa-search"></i>
                    </div>

                </nav>
                <% if (messages.Messages.Count() > 0)
                    {%>
                
                <% foreach (var item in messages.Messages)
                    { %>

                    <div class="messages">
                    <label class="input-container">.
                        <input type="checkbox">
                        <span class="checkmark"></span>
                    </label>
                    <div class="user">
                        <div class="user-status offline"></div>
                        <p class="user-name"><%Response.Write(item.Sender_name); %></p>
                    </div>
                    <div class="message-title">
                        <p><%Response.Write(item.Subject); %></p>
                    </div>
                    <div class="message-date">
                        <p><%Response.Write(item.SendAt.ToShortDateString()); %> </p>
                    </div>
                    <button>
                        <i class="fas fa-sort-down"></i>
                    </button>
                </div>
                <div class="message-content" style="display: none;">
                    <p><%Response.Write(item.Subject); %></p>
                    <p>
                        <%Response.Write(item.Content); %>
                    </p>
                    <div class="btn-container">
                        <button class="reply-message">REPLY</button>
                        <button class="delete-message">DELETE</button>
                    </div>
                </div>
                <%} %>
                
                
                <%} %>
                <div class="messages">
                    <div class="previously-messages">
                        <p>5 Previously Messages</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="reminders-calendar">
            <div class="title">
                <img src="Content/img/reminders-calendar.png" alt="warning-icon">
                <p>
                    REMINDERS CALENDAR
                </p>
                <div class="format">
                    <p>DAILY / WEEKLY / MONTHLY </p>
                    <button>
                        <img src="Content/img/square.png" alt="square">
                    </button>
                    <button>
                        <img src="Content/img/list.png" alt="list">
                    </button>
                </div>
            </div>
            <div class="block-content">
                <%if (reminders.Reminders.Count() > 0)
                    { %>
                <div class="today">
                    <div class="date">
                        <h5>TODAY</h5>
                        <p>2 JULY / MONDAY</p>
                    </div>
                    <%foreach (var item in reminders.Reminders)
                        { %>
                        <%if (item.Description == "")
                            { %>
                            <div class="reminder-title contact">
                                <i class="fas fa-phone"></i>
                                <div class="title-info">
                                    <p><%Response.Write(item.Title); %></p>
                                    <p><%Response.Write(item.Subtitle); %></p>
                                </div>
                            </div>
                        <%}
                        else
                        {%>
                        <div class="reminder-title">
                            <i class="far fa-calendar-alt"></i>
                            <div class="title-info">
                                <p><%Response.Write(item.Title); %></p>
                                <p><%Response.Write(item.Subtitle); %></p>
                            </div>
                            <button class="dismiss">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                        <div class="reminder-content">
                            <div class="date-time">
                                <%Response.Write(item.Date.ToShortDateString()); %> /
                                <span class="time"><%Response.Write(item.Date.ToShortTimeString()); %></span>
                            </div>
                            <div class="description">
                                <p><%Response.Write(item.Description); %></p>
                            </div>
                            <div class="buttons">
                                <button class="change">CHANGE</button>
                                <%if (item.Done == "0")
                                    { %>
                                    <button class="done">DONE</button>
                                <%} %>
                            </div>
                        </div>
                        <%} %>
                    
                    <%} %>
                </div>
                <%} %>

                <div class="calendar">
                    <div class="month">
                        <p id="previous-month">&lt;</p>
                        <p class="actual-month">
                        </p>
                        <p id="next-month">&gt;</p>
                    </div>
                    <div class="week">
                        <p>S</p>
                        <p>M</p>
                        <p>T</p>
                        <p>W</p>
                        <p>T</p>
                        <p>F</p>
                        <p>S</p>
                    </div>
                    <div class="days">
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="circle-of-care">
            <div class="title">
                <img src="Content/img/ties2.png" alt="warning-icon">
                <p>
                    CIRCLE OF CARE
                </p>
            </div>
            <div class="block-content">
                <div class="menu">
                    <div>FIND</div>
                    <div class="selected">MY CIRCLE OF CARE</div>
                    <div>PENDING
                        <span class="notifications">
                            <p class="notification-number"><% Response.Write(followers.Pending.Count()); %></p>
                        </span>
                    </div>
                </div>
                <div class="selected-content">
                    <div class="drag-drop">
                        <p>
                            For organize Drag & Drop in the gropus
                        </p>
                    </div>
                    <%if (followers.Follows.Count() > 0)
                        {
                            int counter = 1;
                            int max = 0;
                            bool green = false;
                            %>
                    <div class="people">
                    <%foreach (var item in followers.Follows)
                        {
                            if (counter == 2 || counter == (max + 3))
                            {
                                green = true;
                                max = counter;
                            }
                            else
                            {
                                green = false;
                            }

                            %>
                    
                        <div class="people-card">
                            <div class="left-column<%if (green) { Response.Write("-green"); } else { Response.Write("-red"); } %>"></div>
                            <div class="user-detail">
                                <div class="name">
                                    <p>
                                        <b><%Response.Write(item.User.Name); %></b>
                                    </p>
                                    <p><%Response.Write(item.User.Employment); %></p>
                                </div>
                                <div class="image">
                                    <img src="Content/img/senior.png" alt="user-image">
                                </div>
                                <div class="message<%if (green) { Response.Write("-green"); }%>">
                                    <button>
                                        Send Message
                                    </button>
                                </div>
                            </div>
                        </div>
                    
                    <%counter++; } %>
                        </div>
                    <%} %>
                </div>
            </div>
        </div>
</asp:Content>
