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
    /// Логика взаимодействия для AddEditPartner.xaml
    /// </summary>
    public partial class AddEditPartner : Page
    {
        private Model.Partner NewPartner { get; set; }
        private Model.MasterFloorDBEntities Context = Model.MasterFloorDBEntities.GetContext();
        private bool IsAdding { get; set; }
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
                IsAdding = false;
                NewPartner = CurrentPartner;
                DataContext = NewPartner;
                NameTextBox.Text = NewPartner.PartnerName.Name;
                TypeComboBox.SelectedIndex = NewPartner.TypeId - 1;
                RatingTextBox.Text = NewPartner.Rating.ToString();
                AdresTextBox.Text = $"{NewPartner.Adres.AdresIndex}, {NewPartner.Adres.Region.Name}, {NewPartner.Adres.City.Name}, " +
                    $"{NewPartner.Adres.Street.Name}, {NewPartner.Adres.HouseNum}";
                FIOTextBox.Text = $"{NewPartner.DirectorSurname} {NewPartner.DirectorName} {NewPartner.DirectorPatronym}";
                PhoneTextBox.Text = NewPartner.Phone;
                EmailTextBox.Text = NewPartner.Email;
            }
            else
            {
                IsAdding = true;
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
                StringBuilder errors = new StringBuilder();
                string Name = NameTextBox.Text.Trim();
                int TypeId = TypeComboBox.SelectedIndex + 1;
                string Rating = RatingTextBox.Text.Trim();
                string FullAdres = AdresTextBox.Text.Trim();
                string FullFio = FIOTextBox.Text.Trim();
                string Phone = PhoneTextBox.Text.Trim();
                string Email = EmailTextBox.Text.Trim();
                if (string.IsNullOrEmpty(Name))
                {
                    errors.AppendLine("Заполните наименование поставщика");
                }
                if (TypeId < 1)
                {
                    errors.AppendLine("Выберите тип поставщика");
                }
                if (string.IsNullOrEmpty(Rating))
                {
                    errors.AppendLine("Заполните рейтинг поставщика");
                }
                else if (!Int32.TryParse(Rating, out var res))
                {
                    errors.AppendLine("Рейтинг - целое число");
                }
                else if(Int32.Parse(Rating) < 0)
                {
                    errors.AppendLine("Рейтинг - положительное число");
                }
                if (string.IsNullOrEmpty(FullAdres))
                {
                    errors.AppendLine("Заполните адрес поставщика");
                }
                else
                {
                    List<string> AdresSplited = FullAdres.Split(',').ToList();
                    if (AdresSplited.Count != 5)
                    {
                        errors.AppendLine("Адрес заполнен не по формату (Индекс, регион, город, улица, номер дома)");
                    }
                    else
                    {
                        if (!Int32.TryParse(AdresSplited[0], out var IndexRes))
                        {
                            errors.AppendLine("Индекс - целое число");
                        }
                        if (!Int32.TryParse(AdresSplited[4], out var HouseNumRes))
                        {
                            errors.AppendLine("Номер дома - целое число");
                        }
                        if (AdresSplited[0].Length > 25)
                        {
                            errors.AppendLine("Индекс слишком большой");
                        }
                        if (AdresSplited[1].Length > 150)
                        {
                            errors.AppendLine("Название региона слишком большое");
                        }
                        if (AdresSplited[2].Length > 50)
                        {
                            errors.AppendLine("Название города слишком большое");
                        }
                        if (AdresSplited[3].Length > 50)
                        {
                            errors.AppendLine("Название улицы слишком большое");
                        }
                        if (AdresSplited[4].Length > 12)
                        {
                            errors.AppendLine("Номер дома слишком большой");
                        }
                    }
                }
                if (string.IsNullOrEmpty(FullFio))
                {
                    errors.AppendLine("Заполните ФИО Директора поставщика");
                }
                else
                {
                    List<string> FIOSplited = FullFio.Split(' ').ToList();
                    if (FIOSplited.Count != 3)
                    {
                        errors.AppendLine("ФИО Директора заполнено неправльно");
                    }
                    else
                    {
                        if (FIOSplited[0].Length > 50)
                        {
                            errors.AppendLine("Фамилия слишком большая");
                        }
                        if (FIOSplited[1].Length > 50)
                        {
                            errors.AppendLine("Имя слишком большое");
                        }
                        if (FIOSplited[2].Length > 50)
                        {
                            errors.AppendLine("Отчество слишком большое");
                        }
                    }
                }
                if (string.IsNullOrEmpty(Phone))
                {
                    errors.AppendLine("Заполните телефон поставщика");
                }
                if (string.IsNullOrEmpty(Email))
                {
                    errors.AppendLine("Заполните email поставщика");
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                List<string> AdresSplit = FullAdres.Split(',').ToList();
                List<string> FIOSplit = FullFio.Split(' ').ToList();
                string Index = AdresSplit[0].Trim();
                string Region = AdresSplit[1].Trim();
                string City = AdresSplit[2].Trim();
                string Street = AdresSplit[3].Trim();
                int HouseNum = Int32.Parse(AdresSplit[4].Trim());
                if (!Context.PartnerName.Any(d => d.Name == Name))
                {
                    Context.PartnerName.Add(new Model.PartnerName() { Name = Name });
                    Context.SaveChanges();
                }
                NewPartner.NameId = Context.PartnerName.Where(d => d.Name == Name).FirstOrDefault().Id;
                NewPartner.TypeId = TypeId;
                NewPartner.Rating = Int32.Parse(Rating);
                if (!Context.Region.Any(d => d.Name == Region))
                {
                    Context.Region.Add(new Model.Region() { Name = Region });
                    Context.SaveChanges();
                }
                int RegionId = Context.Region.Where(d => d.Name == Region).FirstOrDefault().Id;
                if (!Context.City.Any(d => d.Name == City))
                {
                    Context.City.Add(new Model.City() { Name = City });
                    Context.SaveChanges();
                }
                int CityId = Context.City.Where(d => d.Name == City).FirstOrDefault().Id;
                if (!Context.Street.Any(d => d.Name == Street))
                {
                    Context.Street.Add(new Model.Street() { Name = Street });
                    Context.SaveChanges();
                }
                int StreetId = Context.Street.Where(d => d.Name == Street).FirstOrDefault().Id;
                if (!Context.Adres.Any(d => d.AdresIndex == Index && d.RegionId == RegionId
                && d.CityId == CityId && d.StreetId == StreetId && d.HouseNum == HouseNum))
                {
                    Context.Adres.Add(new Model.Adres()
                    {
                        AdresIndex = Index,
                        RegionId = RegionId,
                        CityId = CityId,
                        StreetId = StreetId,
                        HouseNum = HouseNum
                    });
                    Context.SaveChanges();
                }
                NewPartner.AdresId = Context.Adres.Where(d => d.AdresIndex == Index && d.RegionId == RegionId
                    && d.CityId == CityId && d.StreetId == StreetId && d.HouseNum == HouseNum).FirstOrDefault().Id;
                NewPartner.DirectorSurname = FIOSplit[0];
                NewPartner.DirectorName = FIOSplit[1];
                NewPartner.DirectorPatronym = FIOSplit[2];
                NewPartner.Phone = Phone;
                NewPartner.Email = Email;
                if (IsAdding)
                {
                    Context.Partner.Add(NewPartner);
                }
                Context.SaveChanges();
                MessageBox.Show("Успешно сохранено", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                Classes.Navigation.ActiveFrame.RemoveBackEntry();
                Classes.Navigation.ActiveFrame.Navigate(new Pages.Partners());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
