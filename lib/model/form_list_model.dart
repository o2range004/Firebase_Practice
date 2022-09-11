class FormModel {
  final String? id;
  final String? fileName;
  final String? dateCreated;
  final String? status;
  final String? dateEdited;
  final String? createdBy;

  FormModel({
    this.id,
    this.fileName,
    this.dateCreated,
    this.dateEdited,
    this.status,
    this.createdBy,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'fileName': fileName,
        'dateCreated': dateCreated,
        'status': status,
        'dateEdited': dateEdited,
        'createdBy': createdBy,
      };

  static FormModel fromJson(Map<String, dynamic> data) => FormModel(
        id: data['id'],
        fileName: data['fileName'],
        dateCreated: data['dateCreated'],
        status: data['status'],
        dateEdited: data['dateEdited'],
        createdBy: data['createdBy'],
      );
}
