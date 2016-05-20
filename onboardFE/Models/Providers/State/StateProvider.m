//
//  State.m
//  
//
//  Created by Taqtile on 12/15/15.
//  Copyright © 2015 Taqtile. All rights reserved.
//

#import "StateProvider.h"

@interface StateProvider()

@property (strong, nonatomic, readwrite) NSArray* stateInitials;
@property (strong, nonatomic, readwrite) NSArray* stateNames;

@property (strong, nonatomic) NSDictionary* nameToInitial;
@property (strong, nonatomic) NSDictionary* initialToName;

@end

@implementation StateProvider

#pragma mark - public methods
-(NSString *)initialFromName:(NSString *)stateName {
    NSString *initial = [[self nameToInitial] valueForKey:stateName];
    return initial ? initial : stateName;
}

-(NSString *)nameFromInitial:(NSString *)stateInitial {
    NSString *name = [[self initialToName] valueForKey:stateInitial];
    return name ? name : stateInitial;
}

#pragma mark - public getters
-(NSArray *)stateInitials {
    if (!_stateInitials) {
        _stateInitials = [[[self nameToInitial] allValues] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    return _stateInitials;
}

-(NSArray *)stateNames{
    if (!_stateNames) {
        _stateNames = [[[self nameToInitial] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    return _stateNames;
}

#pragma mark - private getters
-(NSDictionary *)nameToInitial {
    if (!_nameToInitial) {
        _nameToInitial = @{
                           @"Acre":                @"AC",
                           @"Alagoas":             @"AL",
                           @"Amapá":               @"AP",
                           @"Amazonas":            @"AM",
                           @"Bahia":               @"BA",
                           @"Ceará":               @"CE",
                           @"Distrito Federal":    @"DF",
                           @"Espírito Santo":      @"ES",
                           @"Goiás":               @"GO",
                           @"Maranhão":            @"MA",
                           @"Mato Grosso":         @"MT",
                           @"Mato Grosso do Sul":  @"MS",
                           @"Minas Gerais":        @"MG",
                           @"Pará":                @"PA",
                           @"Paraíba":             @"PB",
                           @"Paraná":              @"PR",
                           @"Pernambuco":          @"PE",
                           @"Piauí":               @"PI",
                           @"Rio de Janeiro":      @"RJ",
                           @"Rio Grande do Norte": @"RN",
                           @"Rio Grande do Sul":   @"RS",
                           @"Rondônia":            @"RO",
                           @"Roraima":             @"RR",
                           @"Santa Catarina":      @"SC",
                           @"São Paulo":           @"SP",
                           @"Sergipe":             @"SE",
                           @"Tocantins":           @"TO",
                           };
    }
    return _nameToInitial;
}

-(NSDictionary *)initialToName {
    if (!_initialToName) {
        NSMutableDictionary *d = [NSMutableDictionary dictionaryWithDictionary:[self nameToInitial]];
        
        for (NSString *key in [d allKeys]) {
            d[d[key]] = key;
            [d removeObjectForKey:key];
        }

        _initialToName = d;
    }
    return _initialToName;
}
@end
