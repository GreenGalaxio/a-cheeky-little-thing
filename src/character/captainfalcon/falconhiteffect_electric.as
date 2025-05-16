// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//falconhiteffect_electric

package 
{
    import flash.display.MovieClip;

    public dynamic class falconhiteffect_electric extends MovieClip 
    {

        public function falconhiteffect_electric()
        {
            addFrameScript(17, this.frame18);
        }

        internal function frame18():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

