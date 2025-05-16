// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioshield_149

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class warioshield_149 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function warioshield_149()
        {
            addFrameScript(0, this.frame1, 5, this.frame6);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame6():*
        {
            gotoAndPlay("loop");
        }


    }
}//package wario_fla

