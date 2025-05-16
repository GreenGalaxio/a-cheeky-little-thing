// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_hurt_66

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class warioman_hurt_66 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function warioman_hurt_66()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "hurt1";
        }

        internal function frame5():*
        {
            this.xframe = "done1";
        }

        internal function frame6():*
        {
            gotoAndStop("done1");
        }


    }
}//package wario_fla

