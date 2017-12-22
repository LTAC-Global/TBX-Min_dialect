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
        <rule context="*[@target]">
            <assert test="matches(@target,'https?://.+') or @target = //*/@id">ID must be IDREF for internal references or URI following HTTP protocol for external references.</assert>
        </rule>
    </pattern>
    
    <pattern id="XLIFF.inlineConstraints">
        <rule context="tbx:sc[following-sibling::tbx:ec]">
            <assert test="@isolated='no' or not(@isolated)">@isolated must be 'no' if &lt;sc/&gt; or &lt;ec/&gt; has its corresponding &lt;sc/&gt;/&lt;ec/&gt; in the same note text and @startRef must be used for &lt;ec&gt;</assert>
        </rule>
        <rule context="tbx:ec[preceding-sibling::tbx:sc]">
            <assert test="@isolated='no' or not(@isolated)">@isolated must be 'no' if &lt;sc/&gt; or &lt;ec/&gt; has its corresponding &lt;sc/&gt;/&lt;ec/&gt; in the same note text and @startRef must be used for &lt;ec&gt;</assert>
            <assert test="@startRef">@starRef is required for &lt;ec&gt; if it is in the same note text as its corresponding &lt;sc&gt;</assert>
            <!--<assert test="not(@dir)">@dir only permitted when @isolated is 'yes'.</assert>--><!--@dir IS NOT CURRENTLY USED IN TBX-->
        </rule>
        <rule context="tbx:sc[not(following-sibling::tbx:ec)]">
            <assert test="@isolated='yes' or not(@isolated)">@isolated must be 'yes' if &lt;sc/&gt; or &lt;ec/&gt; does not have its corresponding &lt;sc/&gt;/&lt;sc/&gt; in the same note text</assert>
        </rule>
        <rule context="tbx:ec[not(preceding-sibling::tbx:sc)]">
            <assert test="@isolated='yes' or not(@isolated)">@isolated must be 'yes' if &lt;sc/&gt; or &lt;ec/&gt; does not have its corresponding &lt;sc/&gt;/&lt;sc/&gt; in the same note text</assert>
            <assert test="@id">@id is REQUIRED when @isolated is or should be 'yes'.</assert>
        </rule>
        <rule context="tbx:ec[@isolated='yes']">
            <assert test="@id != ''">ID is required if @isolated is 'yes'.</assert>
        </rule>
    </pattern>
    
    <pattern id="dialectEnforcement">
        <rule context="tbx:tbx">
<assert test="attribute::type='TBX-Min'">The name of this dialect should be TBX-Min</assert>
<assert test="attribute::style='dca'">The style of this dialect should be declared as 'dca'</assert>
        </rule>
        <rule context="*[not(namespace-uri() = 'urn:iso:std:iso:30042:ed:3.0')]">
            <assert test="false()">DCT style elements are not permitted in DCA style TBX.</assert>
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
            <assert test=".='admittedTerm-admn-sts' or .='deprecatedTerm-admn-sts' or .='supersededTerm-admn-sts' or .='preferredTerm-admn-sts'">The termType must be either 'admittedTerm-admn-sts', 'deprecatedTerm-admn-sts', 'supersededTerm-admn-sts', or 'preferredTerm-admn-sts'</assert>
        </rule>
        <rule context="tbx:termNote[@type='partOfSpeech']">
            <assert test=".='adjective' or .='noun' or .='other' or .='verb' or .='adverb'">Permitted values of /partOfSpeech/ are 'noun', 'other', 'verb', 'adverb', or 'adjective'</assert>
        </rule>
    </pattern>
</schema>