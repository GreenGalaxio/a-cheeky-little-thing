// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_smash_forward_156

package mario_fla
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

    public dynamic class mario_smash_forward_156 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var attackBox2:MovieClip;
        public var self:*;
        public var xframe:String;
        public var customData:Object;

        public function mario_smash_forward_156()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 8, this.frame9, 9, this.frame10, 13, this.frame14, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            this.customData = {
                "attackBox":{},
                "attackBox2":{
                    "damage":14,
                    "power":30,
                    "kbConstant":93,
                    "hitStun":5,
                    "selfHitStun":2,
                    "priority":5
                }
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            this.xframe = "attack";
            SSF2API.playSound("mario_Fsmash");
        }

        internal function frame14():*
        {
            SSF2API.playSound("fsmash_sfx");
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

