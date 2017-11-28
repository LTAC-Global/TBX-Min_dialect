<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <ns uri="urn:iso:std:iso:30042:ed:3.0" prefix="tbx" />
    
    <pattern id="coreEnforecement">
        <rule context="tbx:termNote">
<assert test="parent::tbx:termSec or parent::tbx:termNoteGrp/parent::tbx:termSec">Any termNote is only allowed at the termSec level.</assert>
        </rule>
        <rule context="tbx:*[@type]">
            <assert test="@type != ''">Data category must be declared.  If no permitted data categories are listed in the grammar schema, blank values are also not allowed.</assert>
        </rule>
    </pattern>
    
    <pattern id="dialectEnforcement">
        <rule context="tbx:tbx">
<assert test="attribute::type='TBX-Min'">The name of this dialect should be TBX-Min</assert>
<assert test="attribute::style='dca'">The style of this dialect should be declared as 'dca'</assert>
        </rule>
    </pattern>
    
    <!-- Min Module Rules -->
    <pattern id="module.min.admin">
        <rule context="tbx:admin[@type='customerSubset']">
<assert test="parent::tbx:termSec or parent::tbx:adminGrp/parent::tbx:termSec">Customer Subset may only appear at the termSec level</assert>
        </rule>
    </pattern>
    <pattern id="module.min.descrip">
        <rule context="tbx:descrip[@type='subjectField']" >
<assert test="parent::tbx:conceptEntry or parent::tbx:descripGrp/parent::tbx:conceptEntry">Subject Field can only appear at conceptEntry level.</assert>
        </rule>
    </pattern>
    <pattern id="module.min.termNote">
        <rule context="tbx:termNote[@type='administrativeStatus']">
<assert test=".='admitted' or .='notRecommended' or .='obsolete' or .='preferred'">The termType must be either 'admitted', 'notRecommended', 'obsolete', or 'preferred'</assert>
        </rule>
        <rule context="tbx:termNote[@type='partOfSpeech']">
<assert test=".='adjective' or .='noun' or .='other' or .='verb' or .='adverb'">Permitted values of /partOfSpeech/ are 'noun', 'other', 'verb', 'adverb', or 'adjective'</assert>
        </rule>
    </pattern>
</schema>