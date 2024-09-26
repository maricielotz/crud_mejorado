using Microsoft.Maui.Controls;
using MiAppCrud.Models;
using MiAppCrud.Controllers;
using System.Linq;

namespace MiAppCrud.Views
{
    public partial class ProveedorEditPage : ContentPage
    {
        private Proveedor _proveedor;

        public ProveedorEditPage(Proveedor proveedor = null)
        {
            InitializeComponent();
            _proveedor = proveedor ?? new Proveedor();

            if (_proveedor.Id != 0)
            {
                NombreEntry.Text = _proveedor.Nombre;
                TelefonoEntry.Text = _proveedor.Telefono;
            }
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            _proveedor.Nombre = NombreEntry.Text;
            _proveedor.Telefono = TelefonoEntry.Text;

            var controller = new ProveedorController();
            if (_proveedor.Id == 0)
                await controller.AddProveedor(_proveedor);  
            else
                await controller.UpdateProveedor(_proveedor);  

            await Navigation.PopAsync();  
        }

        private async void OnDeleteClicked(object sender, EventArgs e)
        {
            if (_proveedor.Id != 0)
            {
                bool isConfirmed = await DisplayAlert("Confirmar Eliminación", "¿Estás seguro de que deseas eliminar este proveedor?", "Sí", "No");
                if (isConfirmed)
                {
                    var controller = new ProveedorController();
                    await controller.DeleteProveedor(_proveedor.Id);  
                    await Navigation.PopAsync();
                }
            }
        }
    }
}
