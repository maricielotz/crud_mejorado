using Microsoft.Maui.Controls;
using MiAppCrud.Models;
using MiAppCrud.Controllers;
using System.Collections.Generic;
using System.Linq;

namespace MiAppCrud.Views
{
    public partial class ProductoEditPage : ContentPage
    {
        private Producto _producto;

        public ProductoEditPage(Producto producto = null)
        {
            InitializeComponent();
            _producto = producto ?? new Producto();

            if (_producto.Id != 0)
            {
                NombreEntry.Text = _producto.Nombre;
                PrecioEntry.Text = _producto.Precio.ToString();
            }

            LoadCategorias(); 
        }

        private void LoadCategorias()
        {         
  
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            
            _producto.Nombre = NombreEntry.Text;
            _producto.Precio = decimal.Parse(PrecioEntry.Text);

            var controller = new ProductoController();
            if (_producto.Id == 0)
                await controller.AddProducto(_producto);  
            else
                await controller.UpdateProducto(_producto);  

            await Navigation.PopAsync();  
        }
        private async void OnDeleteClicked(object sender, EventArgs e)
        {
            if (_producto.Id != 0)
            {
                bool isConfirmed = await DisplayAlert("Confirmar Eliminación", "¿Estás seguro de que deseas eliminar esta categoría?", "Sí", "No");
                if (isConfirmed)
                {
                    await Navigation.PopAsync();
                }
            }
        }
    }
}
