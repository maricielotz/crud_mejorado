using System;
using System.Collections.ObjectModel;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls;
using MiAppCrud.Controllers;
using MiAppCrud.Models;

namespace MiAppCrud.Views
{
    public partial class OrdenEditPage : ContentPage
    {
        private Orden _orden;

        private ObservableCollection<Orden> _ordenes;

        public OrdenEditPage(Orden orden, ObservableCollection<Orden> ordenes)
        {
            InitializeComponent();
            _ordenes = ordenes;

            if (orden == null)
            {
                _orden = new Orden { Fecha = DateTime.Now.ToString("dd/MM/yyyy") };
            }
            else
            {
                _orden = orden;
                FechaEntry.Text = _orden.Fecha; 
            }
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            if (DateTime.TryParseExact(FechaEntry.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out DateTime fechaValida))
            {
                _orden.Fecha = fechaValida.ToString("dd/MM/yyyy");

                if (_orden.Id == 0)
                {
                    _orden.Id = _ordenes.Count + 1;
                    _ordenes.Add(_orden);
                }

                await Navigation.PopAsync();  
            }
            else
            {
                await DisplayAlert("Error", "Por favor, ingresa una fecha válida en formato dd/MM/yyyy.", "OK");
            }
        }

        private async void OnDeleteClicked(object sender, EventArgs e)
        {
            if (_orden.Id != 0)
            {
                _ordenes.Remove(_orden);
                await Navigation.PopAsync();
            }
        }
    }
}
