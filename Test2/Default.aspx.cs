using System.Configuration;
using System;
using System.Web.UI;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.Text;
using MyEasyConnect.Models;
using System.Collections.Generic;

namespace Test2
{


    public partial class _Default : Page
    {
        
        public MessageRS messages;
        public ReminderRS reminders;
        public FollowRS followers;


        protected void Page_Load(object sender, EventArgs e)
        {

            messages = GetJson<MessageRS>(new UserRQ { Id = 3 }, ConfigurationManager.AppSettings["messages"]);

            reminders = GetJson<ReminderRS>(new UserRQ { Id = 3 }, ConfigurationManager.AppSettings["reminders"]);

            followers = GetJson<FollowRS>(new UserRQ { Id = 3 }, ConfigurationManager.AppSettings["followers"]);

        }
        

        private static T GetJson<T>(object rq, string endpoint)
        {
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                using (HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, new Uri(endpoint)))
                {
                    request.Content = new StringContent(JsonConvert.SerializeObject(rq), Encoding.UTF8, "application/json");

                    using (HttpResponseMessage response = client.SendAsync(request).Result)
                    using (HttpContent respContent = response.Content)
                    {
                        string jsonContent = respContent.ReadAsStringAsync().Result;

                        return JsonConvert.DeserializeObject<T>(jsonContent);
                    }
                }
            }
        }
    }
}