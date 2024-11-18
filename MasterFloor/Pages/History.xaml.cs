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
    /// Логика взаимодействия для History.xaml
    /// </summary>
    public partial class History : Page
    {
        public History(Model.Partner CurrentPartner)
        {
            InitializeComponent();
            OnStart(CurrentPartner);
        }
        private void OnStart(Model.Partner CurrentPartner)
        {
            HistoryListView.ItemsSource = Model.MasterFloorDBEntities.GetContext().PartnerProduct
                .Where(d => d.ParnerId == CurrentPartner.Id).ToList();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Navigation.ActiveFrame.CanGoBack)
            {
                Classes.Navigation.ActiveFrame.GoBack();
            }
        }
    }
}
