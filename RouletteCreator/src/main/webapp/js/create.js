const rouletteItems = document.getElementById('roulette_items_list');
const addItemButton = document.getElementById('addItem');
const deleteItemButton = document.getElementById('deleteItem');
let itemCount = 1;

addItemButton.addEventListener('click', () => {
	const newRow = createRow();
	rouletteItems.appendChild(newRow);
});

deleteItemButton.addEventListener('click', () => {
	
});

function createRow() {
	const row = document.createElement('tr');
	row.className = 'item';
	
	const itemNumberCell = document.createElement('td');
	itemNumberCell.textContent = ++itemCount;
	
	const itemNameCell = document.createElement('td');
	const itemNameInput = document.createElement('input');
	itemNameInput.type = 'text';
	itemNameInput.name = 'item_name[]';
	itemNameCell.appendChild(itemNameInput);
	
	const  itemProbabilityCell = document.createElement('td');
	const itemProbabilityInput = document.createElement('input');
	itemProbabilityInput.type = 'number';
	itemProbabilityInput.name = 'item_probability[]';
	itemProbabilityCell.appendChild(itemProbabilityInput);
	
	row.appendChild(itemNumberCell);
	row.appendChild(itemNameCell);
	row.appendChild(itemProbabilityCell);
	
	return row;
}


