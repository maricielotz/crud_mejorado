using System;
using System.Collections.ObjectModel;
using Microsoft.Maui.Controls;

namespace MiAppCrud.Views
{
    public partial class OrdenListPage : ContentPage
    {
        public ObservableCollection<Orden> Ordenes { get; set; }

        public OrdenListPage()
        {
            InitializeComponent();

            Ordenes = new ObservableCollection<Orden>
            {
                new Orden { Id = 1, Fecha = DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy") },
                new Orden { Id = 2, Fecha = DateTime.Now.ToString("dd/MM/yyyy") }
            };

            OrdenesListView.ItemsSource = Ordenes;
        }

        private async void OnAddOrderClicked(object sender, EventArgs e)
        {
            var nuevaOrden = new Orden { Id = Ordenes.Count + 1, Fecha = DateTime.Now.ToString("dd/MM/yyyy") };
            Ordenes.Add(nuevaOrden);

            await Navigation.PushAsync(new OrdenEditPage(nuevaOrden, Ordenes));
        }

        private async void OnOrderTapped(object sender, ItemTappedEventArgs e)
        {
            if (e.Item == null)
                return;

            var ordenSeleccionada = e.Item as Orden;

            await Navigation.PushAsync(new OrdenEditPage(ordenSeleccionada, Ordenes));

            ((ListView)sender).SelectedItem = null;
        }
    }

    public class Orden
    {
        public int Id { get; set; }  
        public string Fecha { get; set; }  
    }
}
