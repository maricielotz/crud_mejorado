using Microsoft.Maui.Controls;
using MiAppCrud.Models;
using MiAppCrud.Controllers;
using System;

namespace MiAppCrud.Views
{
    public partial class CategoriaListPage : ContentPage
    {
        private CategoriaController _controller;

        public CategoriaListPage()
        {
            InitializeComponent();
            _controller = new CategoriaController();
            LoadCategorias();
        }

        private async void LoadCategorias()
        {
            CategoriasListView.ItemsSource = await _controller.GetAllCategorias();
        }

        private async void OnCategoryTapped(object sender, ItemTappedEventArgs e)
        {
            var categoria = (Categoria)e.Item;
            await Navigation.PushAsync(new CategoriaEditPage(categoria));
        }

        private async void OnAddCategoryClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new CategoriaEditPage());
        }

        private async void OnUpdateCategoryClicked(object sender, EventArgs e)
        {
            var categoria = (Categoria)CategoriasListView.SelectedItem;
            if (categoria != null)
            {
                await Navigation.PushAsync(new CategoriaEditPage(categoria));
            }
        }

        private async void OnDeleteCategoryClicked(object sender, EventArgs e)
        {
            var categoria = (Categoria)CategoriasListView.SelectedItem;
            if (categoria != null)
            {
                bool confirm = await DisplayAlert("Confirmar", $"�Est�s seguro de que deseas borrar la categor�a '{categoria.Nombre}'?", "S�", "No");
                if (confirm)
                {
                   
                }
            }
        }
    }
}
