using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterFloor.Pages
{
    /// <summary>
    /// Логика взаимодействия для Partners.xaml
    /// </summary>
    public partial class Partners : Page
    {
        public Partners()
        {
            InitializeComponent();
            OnStart();
        }
        private void OnStart()
        {
            PartnersListView.ItemsSource = Model.MasterFloorDBEntities.GetContext().Partner.ToList();
        }

        private void EditParterButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Navigation.ActiveFrame.Navigate(new Pages.AddEditPartner((sender as Button).DataContext as Model.Partner));
        }

        private void HistoryButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Navigation.ActiveFrame.Navigate(new Pages.History((sender as Button).DataContext as Model.Partner));
        }

        private void AddPartnerButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Navigation.ActiveFrame.Navigate(new Pages.AddEditPartner(null));
        }
    }
}
