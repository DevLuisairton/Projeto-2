// Aqui você irá adicionar o código JavaScript para buscar os dados do banco de dados
// e preencher a div com os produtos

fetch('/api/produtos')
  .then(response => response.json())
  .then(data => {
    const produtosDiv = document.getElementById('produtos');
    data.forEach(produto => {
      const produtoDiv = document.createElement('div');
      produtoDiv.classList.add('produto');
      produtoDiv.innerHTML = `
        <h2>${produto.nome}</h2>
        <p>${produto.descricao}</p>
        <p>Preço: R$ ${produto.preco}</p>
      `;
      produtosDiv.appendChild(produtoDiv);
    });
  });

  const produtos = [
    { nome: 'Smartphone', descricao: 'Último modelo de smartphone', preco: 2500.00 },
    { nome: 'Notebook', descricao: 'Notebook para trabalho e estudo', preco: 3500.00 },
    { nome: 'Tablet', descricao: 'Tablet para consumo de mídia', preco: 1500.00 }
];

produtos.forEach((produto) => {
    db.run('INSERT INTO produtos (nome, descricao, preco) VALUES (?, ?, ?)',
        [produto.nome, produto.descricao, produto.preco],
        (err) => {
            if (err) {
                console.error(err.message);
            }
        }
    );
});