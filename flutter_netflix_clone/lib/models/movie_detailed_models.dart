import 'dart:convert';

class MovieDetailModels {
    bool? adult;
    String? backdropPath;
    BelongsToCollection? belongsToCollection;
    int? budget;
    List<Genre>? genres;
    String? homepage;
    int? id;
    String? imdbId;
    List<String>? originCountry;
    String? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    List<ProductionCompany>? productionCompanies;
    List<ProductionCountry>? productionCountries;
    DateTime? releaseDate;
    int? revenue;
    int? runtime;
    List<SpokenLanguage>? spokenLanguages;
    String? status;
    String? tagline;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

    MovieDetailModels({
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originCountry,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    MovieDetailModels copyWith({
        bool? adult,
        String? backdropPath,
        BelongsToCollection? belongsToCollection,
        int? budget,
        List<Genre>? genres,
        String? homepage,
        int? id,
        String? imdbId,
        List<String>? originCountry,
        String? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        List<ProductionCompany>? productionCompanies,
        List<ProductionCountry>? productionCountries,
        DateTime? releaseDate,
        int? revenue,
        int? runtime,
        List<SpokenLanguage>? spokenLanguages,
        String? status,
        String? tagline,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        MovieDetailModels(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            belongsToCollection: belongsToCollection ?? this.belongsToCollection,
            budget: budget ?? this.budget,
            genres: genres ?? this.genres,
            homepage: homepage ?? this.homepage,
            id: id ?? this.id,
            imdbId: imdbId ?? this.imdbId,
            originCountry: originCountry ?? this.originCountry,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            productionCompanies: productionCompanies ?? this.productionCompanies,
            productionCountries: productionCountries ?? this.productionCountries,
            releaseDate: releaseDate ?? this.releaseDate,
            revenue: revenue ?? this.revenue,
            runtime: runtime ?? this.runtime,
            spokenLanguages: spokenLanguages ?? this.spokenLanguages,
            status: status ?? this.status,
            tagline: tagline ?? this.tagline,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    factory MovieDetailModels.fromJson(String str) => MovieDetailModels.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovieDetailModels.fromMap(Map<String, dynamic> json) => MovieDetailModels(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"] == null ? null : BelongsToCollection.fromMap(json["belongs_to_collection"]),
        budget: json["budget"],
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromMap(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null ? [] : List<ProductionCompany>.from(json["production_companies"]!.map((x) => ProductionCompany.fromMap(x))),
        productionCountries: json["production_countries"] == null ? [] : List<ProductionCountry>.from(json["production_countries"]!.map((x) => ProductionCountry.fromMap(x))),
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: json["spoken_languages"] == null ? [] : List<SpokenLanguage>.from(json["spoken_languages"]!.map((x) => SpokenLanguage.fromMap(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection?.toMap(),
        "budget": budget,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toMap())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": originCountry == null ? [] : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies == null ? [] : List<dynamic>.from(productionCompanies!.map((x) => x.toMap())),
        "production_countries": productionCountries == null ? [] : List<dynamic>.from(productionCountries!.map((x) => x.toMap())),
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": spokenLanguages == null ? [] : List<dynamic>.from(spokenLanguages!.map((x) => x.toMap())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class BelongsToCollection {
    int? id;
    String? name;
    String? posterPath;
    String? backdropPath;

    BelongsToCollection({
        this.id,
        this.name,
        this.posterPath,
        this.backdropPath,
    });

    BelongsToCollection copyWith({
        int? id,
        String? name,
        String? posterPath,
        String? backdropPath,
    }) => 
        BelongsToCollection(
            id: id ?? this.id,
            name: name ?? this.name,
            posterPath: posterPath ?? this.posterPath,
            backdropPath: backdropPath ?? this.backdropPath,
        );

    factory BelongsToCollection.fromJson(String str) => BelongsToCollection.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BelongsToCollection.fromMap(Map<String, dynamic> json) => BelongsToCollection(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
    };
}

class Genre {
    int? id;
    String? name;

    Genre({
        this.id,
        this.name,
    });

    Genre copyWith({
        int? id,
        String? name,
    }) => 
        Genre(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}

class ProductionCompany {
    int? id;
    String? logoPath;
    String? name;
    String? originCountry;

    ProductionCompany({
        this.id,
        this.logoPath,
        this.name,
        this.originCountry,
    });

    ProductionCompany copyWith({
        int? id,
        String? logoPath,
        String? name,
        String? originCountry,
    }) => 
        ProductionCompany(
            id: id ?? this.id,
            logoPath: logoPath ?? this.logoPath,
            name: name ?? this.name,
            originCountry: originCountry ?? this.originCountry,
        );

    factory ProductionCompany.fromJson(String str) => ProductionCompany.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductionCompany.fromMap(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    String? iso31661;
    String? name;

    ProductionCountry({
        this.iso31661,
        this.name,
    });

    ProductionCountry copyWith({
        String? iso31661,
        String? name,
    }) => 
        ProductionCountry(
            iso31661: iso31661 ?? this.iso31661,
            name: name ?? this.name,
        );

    factory ProductionCountry.fromJson(String str) => ProductionCountry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductionCountry.fromMap(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguage {
    String? englishName;
    String? iso6391;
    String? name;

    SpokenLanguage({
        this.englishName,
        this.iso6391,
        this.name,
    });

    SpokenLanguage copyWith({
        String? englishName,
        String? iso6391,
        String? name,
    }) => 
        SpokenLanguage(
            englishName: englishName ?? this.englishName,
            iso6391: iso6391 ?? this.iso6391,
            name: name ?? this.name,
        );

    factory SpokenLanguage.fromJson(String str) => SpokenLanguage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
