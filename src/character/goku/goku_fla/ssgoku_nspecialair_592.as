// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ssgoku_nspecialair_592

package goku_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ssgoku_nspecialair_592 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var xframe:String;
        public var currentCharge:Number;

        public function ssgoku_nspecialair_592()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 13, this.frame14, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 30, this.frame31, 31, this.frame32, 32, this.frame33, 33, this.frame34, 34, this.frame35, 35, this.frame36, 36, this.frame37, 37, this.frame38, 38, this.frame39, 39, this.frame40, 40, this.frame41, 41, this.frame42, 42, this.frame43, 43, this.frame44, 44, this.frame45, 45, this.frame46, 46, this.frame47, 47, this.frame48, 48, this.frame49, 49, this.frame50, 50, this.frame51, 51, this.frame52, 52, this.frame53, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 57, this.frame58, 58, this.frame59, 59, this.frame60, 60, this.frame61, 61, this.frame62, 62, this.frame63, 63, this.frame64, 64, this.frame65, 65, this.frame66, 66, this.frame67, 67, this.frame68, 68, this.frame69, 69, this.frame70, 70, this.frame71, 71, this.frame72, 72, this.frame73, 73, this.frame74, 74, this.frame75, 75, this.frame76, 76, this.frame77, 77, this.frame78, 78, this.frame79, 79, this.frame80, 80, this.frame81, 81, this.frame82, 82, this.frame83, 83, this.frame84, 84, this.frame85, 85, this.frame86, 86, this.frame87, 87, this.frame88, 88, this.frame89, 89, this.frame90, 90, this.frame91, 91, this.frame92, 92, this.frame93, 93, this.frame94, 94, this.frame95, 95, this.frame96, 96, this.frame97, 97, this.frame98, 98, this.frame99, 99, this.frame100, 100, this.frame101, 101, this.frame102, 102, this.frame103, 103, this.frame104, 104, this.frame105, 105, this.frame106, 106, this.frame107, 107, this.frame108, 108, this.frame109, 109, this.frame110, 110, this.frame111, 111, this.frame112, 112, this.frame113, 113, this.frame114, 114, this.frame115, 115, this.frame116, 116, this.frame117, 117, this.frame118, 118, this.frame119, 119, this.frame120, 120, this.frame121, 121, this.frame122, 122, this.frame123, 123, this.frame124, 124, this.frame125, 125, this.frame126, 126, this.frame127, 127, this.frame128, 128, this.frame129, 129, this.frame130, 130, this.frame131, 131, this.frame132, 132, this.frame133, 133, this.frame134, 134, this.frame135, 135, this.frame136, 136, this.frame137, 137, this.frame138, 138, this.frame139, 139, this.frame140, 140, this.frame141, 141, this.frame142, 142, this.frame143, 144, this.frame145, 166, this.frame167, 167, this.frame168, 168, this.frame169, 197, this.frame198, 198, this.frame199, 226, this.frame227, 227, this.frame228, 267, this.frame268);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("currentCharge", 0);
            };
        }

        internal function frame8():*
        {
            SSF2API.playSound("goku_start1");
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.xframe = "charging";
            this.self.setGlobalVariable("currentCharge", 1);
        }

        internal function frame24():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame25():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame26():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame27():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame28():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame29():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame30():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame31():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame32():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage1.5";
        }

        internal function frame33():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame34():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame35():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame36():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame37():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame38():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.self.playAttackSound(1);
        }

        internal function frame39():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame40():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame41():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame42():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage2";
            this.self.setGlobalVariable("currentCharge", 2);
        }

        internal function frame43():*
        {
            SSF2API.playSound("goku_start2");
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame44():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame45():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame46():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame47():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame48():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame49():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame50():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame51():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame52():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame53():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame54():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame55():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame56():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame57():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage2.5";
        }

        internal function frame58():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame59():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame60():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame61():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame62():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame63():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame64():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame65():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame66():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame67():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame68():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame69():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame70():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame71():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame72():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.self.playAttackSound(1);
        }

        internal function frame73():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame74():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame75():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame76():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3";
            this.self.setGlobalVariable("currentCharge", 3);
        }

        internal function frame77():*
        {
            SSF2API.playSound("goku_start3");
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame78():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame79():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame80():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame81():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame82():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame83():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame84():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame85():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame86():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame87():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3.25";
        }

        internal function frame88():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame89():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame90():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame91():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame92():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame93():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame94():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame95():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame96():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame97():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame98():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame99():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame100():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame101():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3.5";
        }

        internal function frame102():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame103():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame104():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame105():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame106():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame107():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame108():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame109():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame110():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame111():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame112():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame113():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "stage3.75";
        }

        internal function frame114():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame115():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame116():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame117():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame118():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame119():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame120():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame121():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame122():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame123():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame124():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.self.playAttackSound(1);
        }

        internal function frame125():*
        {
            SSF2API.playSound("goku_start4");
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame126():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame127():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame128():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            this.xframe = "loop";
            this.self.setGlobalVariable("currentCharge", 4);
            SSF2API.shakeCamera(8);
        }

        internal function frame129():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame130():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame131():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame132():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame133():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame134():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame135():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame136():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame137():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame138():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame139():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame140():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame141():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame142():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                gotoAndPlay("attack");
            };
            gotoAndPlay("loop");
        }

        internal function frame143():*
        {
            this.xframe = "attack";
            this.currentCharge = this.self.getGlobalVariable("currentCharge");
            this.self.updateAttackStats({"linkFrames":false});
            if (this.currentCharge == 2)
            {
                gotoAndPlay("chargeLevel2");
            };
            if (this.currentCharge == 3)
            {
                gotoAndPlay("chargeLevel3");
            };
            if (this.currentCharge == 4)
            {
                gotoAndPlay("chargeLevel4");
            };
            gotoAndPlay("chargeLevel1");
        }

        internal function frame145():*
        {
            SSF2API.playSound("goku_MEHAMEHA");
            this.self.playAttackSound(2);
            this.self.fireProjectile("ssgoku_kame1", 5, -24);
        }

        internal function frame167():*
        {
            this.self.endAttack();
        }

        internal function frame168():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.fireProjectile("ssgoku_kame1", 5, -24);
        }

        internal function frame169():*
        {
            SSF2API.playSound("goku_HAMEHA");
        }

        internal function frame198():*
        {
            this.self.endAttack();
        }

        internal function frame199():*
        {
            SSF2API.playSound("goku_MEHA");
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.fireProjectile("ssgoku_kame2", 5, -24);
        }

        internal function frame227():*
        {
            this.self.endAttack();
        }

        internal function frame228():*
        {
            SSF2API.playSound("goku_HA");
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.fireProjectile("ssgoku_kame2", 5, -24);
        }

        internal function frame268():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

