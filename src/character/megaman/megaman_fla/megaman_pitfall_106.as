// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_pitfall_106

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class megaman_pitfall_106 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function megaman_pitfall_106()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "pitfall";
            stop();
        }


    }
}//package megaman_fla

