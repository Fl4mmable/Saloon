using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Saloon
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        BeautySalonEntities4 _context = new BeautySalonEntities4();
        public List<string> ls = new List<string>();
       public string time_start;
        public string time_end;
        public int DURKA;
        public dynamic selectedRow;
        public MainWindow()
        {
            InitializeComponent();
            EmployeeBox.IsEnabled = false;
            var cli = _context.client.Select(s => new { FullName = s.surname + " " + s.name }).ToList();

            ClientBox.ItemsSource = cli;
            ClientBox.DisplayMemberPath = "FullName";
            var servicess = _context.service.ToList();
            ServiceBox.ItemsSource = servicess;
            ServiceBox.DisplayMemberPath = "name";

        }

        private void ServiceBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var dur = _context.service.FirstOrDefault(s => s.id == ServiceBox.SelectedIndex + 1);
            DURKA = Convert.ToInt32(dur.duration);

            var data = _context.service_list.FirstOrDefault(x => x.service_id == ServiceBox.SelectedIndex + 1);

            int service_id = Convert.ToInt32(data.employee_id);
            var cli = _context.employee.Where(s => service_id == s.post_id).Select(s => new { FullName = s.surname + " " + s.name }).ToList();
            EmployeeBox.ItemsSource = cli;
            EmployeeBox.DisplayMemberPath = "FullName";
            EmployeeBox.IsEnabled = true;

          
            DateTime currentDate = DateTime.Now;

            DateTime workStartTime = new DateTime(currentDate.Year, currentDate.Month, currentDate.Day, 10, 0, 0);
            DateTime workEndTime = new DateTime(currentDate.Year, currentDate.Month, currentDate.Day, 20, 0, 0);

         
            FillAppointments(workStartTime, workEndTime, DURKA);
        }

        private void FillAppointments(DateTime workStartTime, DateTime workEndTime, int duration)
        {
            List<object> appointments = new List<object>();

            while (workStartTime.AddMinutes(duration) <= workEndTime)
            {
                appointments.Add(new { Start = workStartTime.ToString("HH:mm"), End = workStartTime.AddMinutes(duration).ToString("HH:mm") });
                workStartTime = workStartTime.AddMinutes(duration);
            }

            DatePick1.ItemsSource = appointments;
        }

        private void DatePick_CalendarClosed(object sender, RoutedEventArgs e)
        {

            DateTime selectedDate = DatePick.SelectedDate ?? DateTime.Now;
            DayOfWeek dayOfWeek = selectedDate.DayOfWeek;

            var schedules = _context.TimeWork.FirstOrDefault(s => s.day_of_week.name == dayOfWeek.ToString());
            string day = schedules.day_of_week.name.ToString();


        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {


        }
        private void DatePick1_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            selectedRow = DatePick1.SelectedItem;

            time_start = selectedRow.Start;
            time_end = selectedRow.End;
        }

        private void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            if (ClientBox.SelectedIndex == -1|| ServiceBox.SelectedIndex == -1 || EmployeeBox.SelectedIndex == -1 || !DatePick.SelectedDate.HasValue ||time_start ==null || time_end ==null)
            {
                MessageBox.Show("Заполните поля!");

            }
            else
            {
             
                DateTime dayofweek = DatePick.SelectedDate.Value;

                if (dayofweek.DayOfWeek == DayOfWeek.Sunday)
                {
                    MessageBox.Show("В воскресенье салон не работает.");
                    return; // Прекратите выполнение метода
                }

                bool isRecordExists = _context.Records.Any(ras =>
                    ras.timestart == time_start &&
                    ras.timeend == time_end
                );

                if (isRecordExists)
                {
                    MessageBox.Show("Запись с таким временем уже существует.");
                }
                else
                {
                    int selectedEmployeeIndex = EmployeeBox.SelectedIndex + 1;
                    bool isTimeSlotOccupied = _context.Records.Any(ras =>
                        ras.id_employee == selectedEmployeeIndex &&
                        (
                            (string.Compare(time_start, ras.timestart) >= 0 && string.Compare(time_start, ras.timeend) <= 0) ||
                            (string.Compare(time_end, ras.timestart) >= 0 && string.Compare(time_end, ras.timeend) <= 0)
                        )
                    );

                    if (isTimeSlotOccupied)
                    {
                        MessageBox.Show("В это время у выбранного мастера уже есть заказ.");
                    }
                    else
                    {
                        Records r = new Records
                        {
                            ID = 1,
                            id_client = ClientBox.SelectedIndex + 1,
                            id_employee = selectedEmployeeIndex,
                            id_service = ServiceBox.SelectedIndex + 1,
                            id_day_of_week = (int)dayofweek.DayOfWeek,
                            timestart = time_start,
                            timeend = time_end,
                            date = DatePick.SelectedDate.ToString(),
                        };

                        _context.Records.Add(r);
                        _context.SaveChanges();
                        MessageBox.Show("Успешно записано!");
                    }
                }
            }
        }

    








    private void DatePick_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            DateTime selectedDate = DatePick.SelectedDate ?? DateTime.Now;
            if (selectedDate.DayOfWeek == DayOfWeek.Sunday)
            {
                MessageBox.Show("В воскресенье салон не работает.");
                DatePick.SelectedDate = null;
               
            }
        }
    }
}
