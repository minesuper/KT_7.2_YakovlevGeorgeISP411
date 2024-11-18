﻿using System;
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
    /// Логика взаимодействия для AddEditPartner.xaml
    /// </summary>
    public partial class AddEditPartner : Page
    {
        private Model.Partner NewPartner { get; set; }
        private Model.MasterFloorDBEntities Context = Model.MasterFloorDBEntities.GetContext();
        public AddEditPartner(Model.Partner CurrentPartner)
        {
            InitializeComponent();
            OnStart(CurrentPartner);
        }
        private void OnStart(Model.Partner CurrentPartner)
        {
            TypeComboBox.ItemsSource = Context.PartnerType.ToList();
            if (CurrentPartner != null)
            {
                NewPartner = CurrentPartner;
                //ЗАПОЛНЕНИЕ ПОЛЕЙ
            }
            else
            {
                NewPartner = new Model.Partner();
            }
            DataContext = NewPartner;
        }
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Navigation.ActiveFrame.CanGoBack)
            {
                Classes.Navigation.ActiveFrame.GoBack();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}