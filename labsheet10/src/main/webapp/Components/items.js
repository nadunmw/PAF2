$(document).ready(function() {
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();


	// Form validation-------------------
	var status = validateItemForm();
	
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "ItemsAPI",
		type : type,
		data : $("#formItem").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});
});

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#formItem")[0].reset();
}

$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "ItemsAPI",
		type : "DELETE",
		data : "itemID=" + $(this).data("itemid"),
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
		}
	});
});

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// CLIENTMODEL=========================================================================
$(document).on(
		"click",
		".btnUpdate",
		function(event) {
			$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
			$("#fname").val($(this).closest("tr").find('td:eq(1)').text());
			$("#lname").val($(this).closest("tr").find('td:eq(2)').text());
			$("#nic").val($(this).closest("tr").find('td:eq(3)').text());
			$("#dob").val($(this).closest("tr").find('td:eq(4)').text());
			$("#pw").val($(this).closest("tr").find('td:eq(5)').text());
	
		});

function validateItemForm() {
	
	// PHONE NUMBER------------------------
	if ($("#fname").val().trim() == "") {
		return "Insert first name.";
	}
	// DESC------------------------
	if ($("#lname").val().trim() == "") {
		return "Insert last name.";
	}
	
	if ($("#nic").val().trim() == "") {
		return "Insert NIC.";
	}
	if ($("#dob").val().trim() == "") {
		return "Insert DOB.";
	}
	if ($("#pw").val().trim() == "") {
		return "Insert PASSWORD.";
	}
	
	return true;
}
